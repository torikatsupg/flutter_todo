import 'package:flutter/widgets.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/util/pagenated_list_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../../generated/view/page/task_tab/todo_tab_controller.freezed.dart';

final todoTabControllerProvider =
    StateNotifierProvider.family<TodoTabController, _TodoTabState, UserId>(
  TodoTabController.new,
);

final todoTaskListItemProvider = Provider<Task>(
  (ref) => throw UnimplementedError(),
);

class TodoTabController extends StateNotifier<_TodoTabState> {
  TodoTabController(this._ref, this._userId)
      : super(
          _TodoTabState(
            list: _ref.read(todoTasksFamily(_userId)),
            scrollController: ScrollController(),
          ),
        ) {
    state.scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.scrollController.offset >
          state.scrollController.position.maxScrollExtent - 100) {
        _ref.read(todoTasksFamily(_userId).notifier).loadMore();
      }
    });

    _ref.listen<AsyncPagenatedList<Task, FirestoreError>>(
        todoTasksFamily(_userId), (_, next) => onChagneList(next));
  }

  final Ref _ref;
  final UserId _userId;

  void onChagneList(AsyncPagenatedList<Task, FirestoreError> list) =>
      state = state.copyWith(list: list);

  Future<void> refresh() =>
      _ref.read(todoTasksFamily(_userId).notifier).refresh();

  Future<void> resolveAndLoadMore() =>
      _ref.read(todoTasksFamily(_userId).notifier).loadMore();

  void onPressItem(TaskId taskId) => _ref.read(routerProvider).goNamed_(
        Routes.taskDetail,
        params: {
          ParamKeys.tab: HomeTab.task.value,
          ParamKeys.taskId: taskId.value,
        },
      );

  Future<void> onDismissedItem(Task task) =>
      _ref.read(loadingProvider.notifier).run(
        () async {
          await _ref.read(taskRepositoryFamily(_userId)).update(task.done());
          _ref.read(todoTasksFamily(_userId).notifier).delete(task);
          _ref.read(doneTasksFamily(_userId).notifier).insert(task);
        },
      );

  @override
  void dispose() {
    super.dispose();
    state.dispose();
  }
}

@freezed
class _TodoTabState with _$_TodoTabState {
  factory _TodoTabState({
    required AsyncPagenatedList<Task, FirestoreError> list,
    required ScrollController scrollController,
  }) = __TodoTabState;

  _TodoTabState._();

  void dispose() {
    scrollController.dispose();
  }
}
