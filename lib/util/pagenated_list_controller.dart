import 'package:flutter_todo/infrastructure/cursor_impl.dart';
import 'package:flutter_todo/model/query_list.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/util/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/util/pagenated_list_controller.freezed.dart';

// TODO(torikatsu): handle error.
class PagenatedListController<Item, Err>
    extends StateNotifier<AsyncPagenatedList<Item, Err>> {
  PagenatedListController(this._fetch) : super(const AsyncValue.loading());

  final Fetch<Item, Err> _fetch;

  Future<void> initialize() async {
    state = (await _fetch()).map(
      ok: (data) => AsyncValue.data(
        PagenatedList(list: data.value.list, cursor: data.value.cursor),
      ),
      err: AsyncValue.error,
    );
  }

  Future<void> refresh() async => state.whenData(
        (data) async {
          if (!data.canRefresh) return;
          state = AsyncValue.data(data.copyWith(isRefreshing: true));
          state = (await _fetch()).map(
            ok: (result) => AsyncValue.data(
              data.copyWith(
                list: result.value.list,
                cursor: result.value.cursor,
                refreshError: null,
                isRefreshing: false,
              ),
            ),
            err: (e) => AsyncValue.data(
              data.copyWith(
                refreshError: e.value,
                isRefreshing: false,
              ),
            ),
          );
        },
      );

  void resolveAndLoadMore() async => state.whenData(
        (data) async {
          state = AsyncValue.data(data.copyWith(loadMoreError: null));
          await loadMore();
        },
      );

  Future<void> loadMore() async => state.whenData(
        (data) async {
          if (!data.canLoadMore) return;
          state = AsyncValue.data(data.copyWith(isMoreLoading: true));
          state = (await _fetch(data.cursor)).map(
            ok: (result) => AsyncValue.data(
              data.copyWith(
                list: [...data.list, ...result.value.list],
                cursor: result.value.cursor,
                hasMoreData: result.value.hasMoreData,
                isMoreLoading: false,
              ),
            ),
            err: (e) => AsyncValue.data(
              data.copyWith(
                loadMoreError: e.value,
                isMoreLoading: false,
              ),
            ),
          );
        },
      );

  void insert(Item item) => state = state.whenData(
        (state) => state.copyWith(
          list: [item, ...state.list],
        ),
      );

  void update(Item item) => state = state.whenData(
        (data) => data.copyWith(
          list: data.list.map((e) => e == item ? item : e).toList(),
        ),
      );

  void delete(Item item) => state = state.whenData(
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

typedef AsyncPagenatedList<Item, Err> = AsyncValue<PagenatedList<Item, Err>>;

typedef Fetch<Item, Err> = Future<Result<QueryList<Item, CursorImpl>, Err>>
    Function([CursorImpl? impl]);
