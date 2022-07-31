import 'package:flutter_todo/infrastructure/cursor_impl.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:flutter_todo/model/query_list.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/util/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/util/pagenated_list_controller.freezed.dart';

class PagenatedListController<Item, Err>
    extends StateNotifier<AsyncPagenatedList<Item, Err>> {
  PagenatedListController(this._fetch) : super(const AsyncValue.loading()) {
    _initialize();
  }

  final Fetch<Item, Err> _fetch;

  Future<void> _initialize() async {
    state = (await _fetch()).flatMap(
      ok: (data) => AsyncValue.data(
        Result.ok(
          PagenatedList(list: data.list, cursor: data.cursor),
        ),
      ),
      err: (e) => AsyncValue.data(Result.err(e)),
    );
  }

  Future<void> refresh() async {
    if (!state.maybeFlatMap((v) => v.canRefresh, false)) return;
    state = state.flatMapData((data) => data.copyWith(isRefreshing: true));
    final result = await _fetch();
    state = state.flatMapData(
      (state) => result.flatMap(
        ok: (ok) => state.copyWith(
          list: ok.list,
          cursor: ok.cursor,
          refreshError: null,
          isRefreshing: false,
        ),
        err: (e) => state.copyWith(
          refreshError: e,
          isRefreshing: false,
        ),
      ),
    );
  }

  void resolveAndLoadMore() async {
    state = state.flatMapData((data) => data.copyWith(loadMoreError: null));
    await loadMore();
  }

  Future<void> loadMore() async {
    if (!state.maybeFlatMap((data) => data.canLoadMore, false)) return;
    state = state.flatMapData((data) => data.copyWith(isMoreLoading: true));
    final cursor = state.maybeFlatMap((data) => data.cursor, null);
    final result = await _fetch(cursor);
    state = state.flatMapData(
      (data) => result.map(
        ok: (result) => data.copyWith(
          list: [...data.list, ...result.value.list],
          cursor: result.value.cursor,
          hasMoreData: result.value.hasMoreData,
          isMoreLoading: false,
        ),
        err: (e) => data.copyWith(
          loadMoreError: e.value,
          isMoreLoading: false,
        ),
      ),
    );
  }

  void insert(Item item) => state = state.flatMapData(
        (state) => state.copyWith(
          list: [item, ...state.list],
        ),
      );

  void update(bool Function(Item) isTarget, Item next) => state = state.flatMapData(
        (data) => data.copyWith(
          list: data.list.map((item) => isTarget(item) ? next : item).toList(),
        ),
      );

  void delete(Item item) => state = state.flatMapData(
        (data) => data.copyWith(
          list: data.list.where((e) => e == item).toList(),
        ),
      );
}

@freezed
class PagenatedList<Item, Err> with _$PagenatedList<Item, Err> {
  factory PagenatedList({
    @Default([]) List<Item> list,
    CursorImpl? cursor,
    @Default(false) isRefreshing,
    @Default(false) isMoreLoading,
    @Default(true) hasMoreData,
    @Default(null) Err? refreshError,
    @Default(null) Err? loadMoreError,
  }) = _PagenatedList<Item, Err>;

  late final bool hasLoadMoreError = isNotNull(loadMoreError);
  late final bool hasRefreshError = isNotNull(refreshError);
  late final bool canLoadMore =
      !isMoreLoading && !hasLoadMoreError && hasMoreData;
  late final bool canRefresh = !isRefreshing;

  PagenatedList._();
}

typedef AsyncPagenatedList<Item, Err>
    = AsyncValue<Result<PagenatedList<Item, Err>, Err>>;

typedef Fetch<Item, Err> = Future<Result<QueryList<Item, CursorImpl>, Err>>
    Function([CursorImpl? impl]);
