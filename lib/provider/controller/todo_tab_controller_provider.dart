import 'package:flutter/material.dart';
import 'package:flutter_todo/infrastructure/task_repository_impl.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/controller/todo_tab_controller_provider.freezed.dart';

final todoTabControllerProvider =
    StateNotifierProvider.autoDispose<TodoTabController, TodoTabState>(
  (ref) {
    final uid = ref.watch(authProvider).uid;
    final repository = ref.watch(taskRepositoryFamily(uid));
    return TodoTabController(repository);
  },
);

class TodoTabController extends StateNotifier<TodoTabState> {
  TodoTabController(this._repository) : super(TodoTabState.loading()) {
    _initialize();
  }

  final TaskRepository<CursorImpl> _repository;

  Future<void> _initialize() async {
    final controller = ScrollController();
    controller.addListener(() {
      // TODO(torikatsu): chack this conditions
      if (controller.offset > controller.position.maxScrollExtent - 100) {
        _loadMore();
      }
    });
    try {
      final result = await _repository.findAllTodo();
      state = TodoTabState.data(
        controller: controller,
        items: result.list,
        cursors: [result.cursor],
      );
    } on dynamic catch (e) {
      state = TodoTabState.error();
    }
  }

  Future<void> refresh() async {
    if (!state.canRefresh) return;
    state = state.whenData((data) => data.copyWith(isRefreshing: true));
    try {
      final result = await _repository.findAllTodo();
      state = state.whenData(
        (data) => data.copyWith(
          items: result.list,
          cursors: [result.cursor],
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
    await _loadMore();
  }

  Future<void> _loadMore() async {
    if (!state.canLoadMore) return;
    state = state.whenData((data) => data.copyWith(isMoreLoading: true));
    try {
      final result = await _repository.findAllTodo();
      state = state.whenData(
        (data) => data.copyWith(
          items: data.items..addAll(result.list),
          cursors: data.cursors..add(result.cursor),
          hasMoreData: result.hasMoreData,
        ),
      );
    } on dynamic catch (e) {
      state = state.whenData((data) => data.copyWith(loadMoreError: e));
    } finally {
      state = state.whenData((data) => data.copyWith(isMoreLoading: false));
    }
  }

  void insert(Task item) => state = state.whenData(
        (state) => state.copyWith(
          items: state.items..insert(0, item),
        ),
      );

  void update(Task item) => state = state.whenData(
        (data) => data.copyWith(
          items: data.items.map((e) => e == item ? item : e).toList(),
        ),
      );

  void delete(Task item) => state = state.whenData(
        (data) => data.copyWith(
          items: data.items..remove(item),
        ),
      );
}

@freezed
class TodoTabState with _$TodoTabState {
  factory TodoTabState.data({
    required ScrollController controller,
    @Default([]) List<Task> items,
    @Default([]) List<CursorImpl> cursors,
    @Default(false) isRefreshing,
    @Default(false) isMoreLoading,
    @Default(true) hasMoreData,
    @Default(null) dynamic refreshError,
    @Default(null) dynamic loadMoreError,
  }) = _Data;

  factory TodoTabState.error() = _Error;
  factory TodoTabState.loading() = _Loading;

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

  TodoTabState whenData(TodoTabState Function(_Data data) functor) =>
      maybeMap(data: functor, orElse: () => this);

  TodoTabState._();
}
