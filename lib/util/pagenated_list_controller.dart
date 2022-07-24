import 'package:flutter_todo/infrastructure/cursor_impl.dart';
import 'package:flutter_todo/model/query_list.dart';
import 'package:flutter_todo/util/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/util/pagenated_list_controller.freezed.dart';

// TODO(torikatsu): handle error.
class PagenatedListController<Item>
    extends StateNotifier<AsyncPagenatedList<Item>> {
  PagenatedListController(this._fetch) : super(const AsyncValue.loading());

  final Fetch<Item> _fetch;

  Future<void> initialize() async {
    try {
      final result = await _fetch();
      state = AsyncValue.data(
        PagenatedList<Item>(
          list: result.list,
          cursor: result.cursor,
        ),
      );
    } on dynamic catch (e) {
      print(e);
      state = AsyncValue.error(e);
    }
  }

  Future<void> refresh() async => state.whenData(
        (data) async {
          if (!data.canRefresh) return;
          state = AsyncValue.data(data.copyWith(isRefreshing: true));
          try {
            final result = await _fetch();
            state = AsyncValue.data(data.copyWith(
              list: result.list,
              cursor: result.cursor,
              refreshError: null,
              isRefreshing: false,
            ));
          } on dynamic catch (e) {
            print(e);
            state = AsyncValue.data(data.copyWith(
              refreshError: e,
              isRefreshing: false,
            ));
          }
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
          try {
            final result = await _fetch(data.cursor);
            state = AsyncValue.data(data.copyWith(
              list: [...data.list, ...result.list],
              cursor: result.cursor,
              hasMoreData: result.hasMoreData,
              isMoreLoading: false,
            ));
          } on dynamic catch (e) {
            state = AsyncValue.data(data.copyWith(
              loadMoreError: e,
              isMoreLoading: false,
            ));
          }
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
class PagenatedList<Item> with _$PagenatedList<Item> {
  factory PagenatedList({
    @Default([]) List<Item> list,
    CursorImpl? cursor,
    @Default(false) isRefreshing,
    @Default(false) isMoreLoading,
    @Default(true) hasMoreData,
    @Default(null) dynamic refreshError,
    @Default(null) dynamic loadMoreError,
  }) = _Data<Item>;

  late final bool hasLoadMoreError = isNotNull(loadMoreError);
  late final bool hasRefreshError = isNotNull(refreshError);
  late final bool canLoadMore =
      !isMoreLoading && !hasLoadMoreError && hasMoreData;
  late final bool canRefresh = !isRefreshing;

  PagenatedList._();
}

typedef AsyncPagenatedList<Item> = AsyncValue<PagenatedList<Item>>;

typedef Fetch<Item> = Future<QueryList<Item, CursorImpl>> Function(
    [CursorImpl? impl]);
