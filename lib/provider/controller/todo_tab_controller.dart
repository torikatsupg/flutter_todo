import 'package:flutter/widgets.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:flutter_todo/util/pagenated_list_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/todo_tab_controller.freezed.dart';

final todoTabControllerProvider =
    StateNotifierProvider<TodoTabController, _TodoTabState>(
  (ref) => TodoTabController(
    ref,
    ref.read(authProvider).uid,
  ),
);

class TodoTabController extends StateNotifier<_TodoTabState> {
  TodoTabController(Ref ref, this._uid)
      : super(
          _TodoTabState(
            list: ref.read(todoTasksFamily(_uid)),
            scrollController: ScrollController(),
          ),
        ) {
    _read = ref.read;

    state.scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.scrollController.offset >
          state.scrollController.position.maxScrollExtent - 100) {
        _read(todoTasksFamily(_uid).notifier).loadMore();
      }
    });

    ref.listen<AsyncPagenatedList<Task, FirestoreError>>(
        todoTasksFamily(_uid), (_, next) => onChagneList(next));
  }

  late final Reader _read;
  final String _uid;

  void onChagneList(AsyncPagenatedList<Task, FirestoreError> list) =>
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
    required AsyncPagenatedList<Task, FirestoreError> list,
    required ScrollController scrollController,
  }) = __TodoTabState;

  _TodoTabState._();
}
