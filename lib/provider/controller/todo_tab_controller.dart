import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:flutter_todo/util/list_cache_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/todo_tab_controller.freezed.dart';

final todoTabControllerProvider =
    StateNotifierProvider<TodoTabController, _TodoTabState>(
  (ref) {
    final uid = ref.read(authProvider).uid;
    final controller = TodoTabController(ref, uid);
    // avoid modify provider during their initialization
    Future.delayed(const Duration(microseconds: 1)).then(
      (_) => ref.read(todoTasksFamily(uid).notifier).initialize(),
    );
    return controller;
  },
);

class TodoTabController extends StateNotifier<_TodoTabState> {
  TodoTabController(Ref ref, this._uid)
      : super(_TodoTabState(
          list: ref.read(todoTasksFamily(_uid)),
          scrollController: ScrollController(),
        )) {
    _read = ref.read;

    state.scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.scrollController.offset >
          state.scrollController.position.maxScrollExtent - 100) {
        _read(todoTasksFamily(_uid).notifier).loadMore();
      }
    });

    ref.listen<ListCacheState<Task>>(
        todoTasksFamily(_uid), (_, next) => onChagneList(next));
  }

  late final Reader _read;
  final String _uid;

  void onChagneList(ListCacheState<Task> list) =>
      state = state.copyWith(list: list);

  Future<void> refresh() => _read(todoTasksFamily(_uid).notifier).refresh();

  Future<void> resolveAndLoadMore() =>
      _read(todoTasksFamily(_uid).notifier).loadMore();

  void onPressItem(String taskId) =>
      _read(routerProvider.notifier).go('/home/todo/$taskId');
}

@freezed
class _TodoTabState with _$_TodoTabState {
  factory _TodoTabState({
    required ListCacheState<Task> list,
    required ScrollController scrollController,
  }) = __TodoTabState;

  _TodoTabState._();
}
