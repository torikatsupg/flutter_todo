import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/util/list_cache_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/todo_tab_controller.freezed.dart';

final todoTabControllerProvider =
    StateNotifierProvider<TodoTabController, _TodoTabState>(
  (ref) {
    final uid = ref.watch(authProvider).uid;
    final scrollController = ScrollController();
    scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (scrollController.offset >
          scrollController.position.maxScrollExtent - 100) {
        ref.read(todoTasksFamily(uid).notifier).loadMore();
      }
    });
    final controller = TodoTabController(ref.read, uid, scrollController);
    ref.listen<ListCacheState<Task>>(
      todoTasksFamily(uid),
      (_, next) => controller.onChagneList(next),
    );
    // avoid modify provider during their initialization
    Future.delayed(const Duration(microseconds: 1))
        .then((_) => ref.read(todoTasksFamily(uid).notifier).initialize());
    return controller;
  },
);

class TodoTabController extends StateNotifier<_TodoTabState> {
  TodoTabController(this._read, this._uid, scrollController)
      : super(_TodoTabState(
          list: _read(todoTasksFamily(_uid)),
          scrollController: scrollController,
        ));

  final Reader _read;
  final String _uid;

  void onChagneList(ListCacheState<Task> list) =>
      state = state.copyWith(list: list);

  Future<void> refresh() => _read(todoTasksFamily(_uid).notifier).refresh();

  Future<void> resolveAndLoadMore() =>
      _read(todoTasksFamily(_uid).notifier).loadMore();
}

@freezed
class _TodoTabState with _$_TodoTabState {
  factory _TodoTabState({
    required ListCacheState<Task> list,
    required ScrollController scrollController,
  }) = __TodoTabState;

  _TodoTabState._();
}
