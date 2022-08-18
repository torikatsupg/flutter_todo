import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/util/tupple.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';

part '../../../generated/view/page/edit_task_page/edit_task_page_controller.freezed.dart';

final prepareTaskEditProvider = Provider.autoDispose
    .family<AsyncValue<Result<Task, FirestoreError>>, T2<UserId, TaskId>>(
  (ref, args) => ref.watch(taskFamily(args)),
);

final taskEditControllerFamily = StateNotifierProvider.autoDispose
    .family<TaskEditController, _TaskEditState, T2<UserId, Task>>(
  TaskEditController.new,
);

class TaskEditController extends StateNotifier<_TaskEditState> {
  TaskEditController(this._ref, T2<UserId, Task> args)
      : userId = args.v1,
        super(
          _TaskEditState(
            initTask: args.v2,
            name: createFormModel(mandatoryValidator, args.v2.name),
          ),
        );

  final Ref _ref;
  final UserId userId;

  void onChangeName(FormModel name) => state = state.copyWith(name: name);

  bool _isTarget(Task item) => item.id == state.initTask.id;

  Future<void> onSubmit() async {
    state = state.copyWith(name: state.name.onSubmit());
    if (!state.isValidAll) {
      return;
    }
    final updatedTask = state.initTask.updateName(state.name.text);
    await _ref.read(loadingProvider.notifier).run(() async {
      await _ref.read(taskRepositoryFamily(userId)).update(updatedTask);
      updatedTask.isDone
          ? _ref
              .read(doneTasksFamily(userId).notifier)
              .update(_isTarget, updatedTask)
          : _ref
              .read(todoTasksFamily(userId).notifier)
              .update(_isTarget, updatedTask);
      _ref.refresh(
        taskFamily(
          T2(
            userId,
            state.initTask.id,
          ),
        ),
      );
      _ref.read(routerProvider).goNamed_(Routes.home);
    });
  }
}

@freezed
class _TaskEditState with _$_TaskEditState {
  factory _TaskEditState({
    required Task initTask,
    required FormModel name,
  }) = __TaskEditState;

  late final isValidAll = name.isValid;

  _TaskEditState._();
}
