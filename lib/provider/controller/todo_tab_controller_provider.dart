import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/controller/todo_tab_controller_provider.freezed.dart';

final todoTabControllerProvider =
    StateNotifierProvider.autoDispose<TodoTabController, TodoTabState>(
        (ref) => TodoTabController(ref));

const pageSize = 20;

class TodoTabController extends StateNotifier<TodoTabState> {
  TodoTabController(this._ref) : super(TodoTabState.loading()) {
    _initialize();
  }

  final AutoDisposeStateNotifierProviderRef _ref;

  Future<void> _initialize() async {
    final controller = ScrollController();
    controller.addListener(() {
      if (controller.offset > controller.position.maxScrollExtent - 100) {
        _loadMore();
      }
    });
    try {
      state = TodoTabState.data(
        controller: controller,
        items: await _ref.read(loadFamily(null)),
        cursor: pageSize,
      );
    } on dynamic catch (e) {
      state = TodoTabState.error();
    }
  }

  Future<void> refresh() async {
    if (state is! _Data) return;

    if ((state as _Data).isRefreshing) return;
    state = (state as _Data).copyWith(isRefreshing: true, refreshError: null);
    final currentState = state as _Data;

    try {
      final nextItems = await _ref.read(loadFamily(null));
      state = currentState.copyWith(items: nextItems, cursor: pageSize);
    } on dynamic catch (e) {
      state = currentState.copyWith(refreshError: e);
    } finally {
      state = (state as _Data).copyWith(isRefreshing: false);
    }
  }

  Future<void> _loadMore() async {
    if (state is! _Data) return;
    final currentState = state as _Data;

    if (currentState.isMoreLoading || currentState.hasLoadMoreError) return;
    state = currentState.copyWith(isMoreLoading: true);

    try {
      final nextItems = await _ref.read(loadFamily(currentState.cursor));
      state = currentState.copyWith(
        items: currentState.items..addAll(nextItems),
        cursor: currentState.cursor + pageSize,
      );
    } on dynamic catch (e) {
      state = currentState.copyWith(loadMoreError: e);
    } finally {
      state = (state as _Data).copyWith(isMoreLoading: false);
    }
  }

  void insert(Task item) => state = state.maybeMap(
        data: (state) => state.copyWith(
          items: state.items..insert(0, item),
        ),
        orElse: () => state,
      );

  void update(Task item) => state = state.maybeMap(
        data: (data) => data.copyWith(
          items: data.items.map((e) => e == item ? item : e).toList(),
        ),
        orElse: () => state,
      );

  void delete(Task item) => state = state.maybeMap(
        data: (data) => data.copyWith(
          items: data.items..remove(item),
        ),
        orElse: () => state,
      );

  void resolveAndLoadMore() async {
    if (state is! _Data) return;
    final currentState = state as _Data;

    state = currentState.copyWith(loadMoreError: null);
    await _loadMore();
  }
}

@freezed
class TodoTabState with _$TodoTabState {
  factory TodoTabState.data({
    required ScrollController controller,
    @Default([]) List<Task> items,
    @Default(0) int cursor,
    @Default(false) isRefreshing,
    @Default(false) isMoreLoading,
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

  TodoTabState._();
}

final loadFamily = Provider.autoDispose.family<Future<List<Task>>, int?>(
  (ref, maybeCursor) async {
    await Future.delayed(const Duration(seconds: 1));

    if (Random().nextInt(3) % 3 == 0) throw 'e';

    final cursor = maybeCursor ?? 0;
    return List.generate(
      pageSize,
      (index) => Task(
        id: '${index + cursor}',
        name: 'name_${index + cursor}',
        createdAt: DateTime.now(),
        isDone: false,
      ),
    );
  },
);
