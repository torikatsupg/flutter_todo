import 'package:flutter_todo/infrastructure/cursor_impl.dart';
import 'package:flutter_todo/model/query_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/util/list_cache_controller.freezed.dart';

// TODO(torikatsu): handle error.
class ListCacheController<Item> extends StateNotifier<ListCacheState<Item>> {
  ListCacheController(this._fetch) : super(ListCacheState<Item>.loading());

  final Fetch<Item> _fetch;

  Future<void> initialize() async {
    state = ListCacheState.loading();
    try {
      final result = await _fetch();
      state = ListCacheState<Item>.data(
        items: result.list,
        cursor: result.cursor,
      );
    } on dynamic catch (e) {
      state = ListCacheState.error();
    }
  }

  Future<void> refresh() async {
    if (!state.canRefresh) return;
    state = state.whenData((data) => data.copyWith(isRefreshing: true));
    try {
      final result = await _fetch();
      state = state.whenData(
        (data) => data.copyWith(
          items: result.list,
          cursor: result.cursor,
          refreshError: null,
        ),
      );
    } on dynamic catch (e) {
      state = state.whenData((data) => data.copyWith(refreshError: e));
    } finally {
      state = state.whenData((data) => data.copyWith(isRefreshing: false));
    }
  }

  void resolveAndLoadMore() async {
    state = state.whenData((data) => data.copyWith(loadMoreError: null));
    await loadMore();
  }

  Future<void> loadMore() async {
    if (!state.canLoadMore) return;
    state = state.whenData((data) => data.copyWith(isMoreLoading: true));
    try {
      final result = await _fetch(state.maybeCursor);
      state = state.whenData(
        (data) => data.copyWith(
          items: data.items..addAll(result.list),
          cursor: result.cursor,
          hasMoreData: result.hasMoreData,
        ),
      );
    } on dynamic catch (e) {
      state = state.whenData((data) => data.copyWith(loadMoreError: e));
    } finally {
      state = state.whenData((data) => data.copyWith(isMoreLoading: false));
    }
  }

  void insert(Item item) => state = state.whenData(
        (state) => state.copyWith(
          items: state.items..insert(0, item),
        ),
      );

  void update(Item item) => state = state.whenData(
        (data) => data.copyWith(
          items: data.items.map((e) => e == item ? item : e).toList(),
        ),
      );

  void delete(Item item) => state = state.whenData(
        (data) => data.copyWith(
          items: data.items..remove(item),
        ),
      );
}

@freezed
class ListCacheState<Item> with _$ListCacheState<Item> {
  factory ListCacheState.data({
    @Default([]) List<Item> items,
    CursorImpl? cursor,
    @Default(false) isRefreshing,
    @Default(false) isMoreLoading,
    @Default(true) hasMoreData,
    @Default(null) dynamic refreshError,
    @Default(null) dynamic loadMoreError,
  }) = _Data<Item>;

  factory ListCacheState.error() = _Error;
  factory ListCacheState.loading() = _Loading;

  late final bool hasLoadMoreError = maybeMap(
    data: (data) => data.loadMoreError != null,
    orElse: () => false,
  );

  late final bool hasRefreshError = maybeMap(
    data: (data) => data.refreshError != null,
    orElse: () => false,
  );

  late final bool canLoadMore = maybeMap(
    data: (data) =>
        !data.isMoreLoading && !data.hasLoadMoreError && data.hasMoreData,
    orElse: () => false,
  );

  late final bool canRefresh = maybeMap(
    data: (data) => !data.isRefreshing,
    orElse: () => false,
  );

  late final CursorImpl? maybeCursor = maybeMap(
    data: (data) => data.cursor,
    orElse: () => null,
  );

  ListCacheState<Item> whenData(
          ListCacheState<Item> Function(_Data<Item> data) functor) =>
      maybeMap(data: functor, orElse: () => this);

  ListCacheState._();
}

typedef Fetch<Item> = Future<QueryList<Item, CursorImpl>> Function(
    [CursorImpl? impl]);
