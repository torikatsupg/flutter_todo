import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/util/riverpod_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';

part '../../generated/provider/controller/task_edit_controller_provider.freezed.dart';

final prepareTaskEditProvider = Provider.autoDispose
    .family<AsyncValue<Result<Task, FirestoreError>>, TaskId>(
  (ref, id) => ref.watch(
    taskFamily(
      TaskArg(
        uid: ref.read(authProvider).uid,
        taskId: id,
      ),
    ),
  ),
);

final taskEditControllerFamily = StateNotifierProvider.autoDispose
    .family<TaskEditController, _TaskEditState, Task>(TaskEditController.new);

class TaskEditController extends StateNotifier<_TaskEditState> {
  TaskEditController(Ref ref, Task initTask)
      : _read = ref.read,
        _refresh = ref.refresh,
        super(
          _TaskEditState(
            initTask: initTask,
            name: createFormModel(mandatoryValidator, initTask.name),
          ),
        ) {
    state.name.setListeners(_onChangeText, _onFocusChanged);
  }

  final Reader _read;
  final Refresh _refresh;

  void _onChangeText() {
    state = state.copyWith(name: state.name.onChangeText());
  }

  void _onFocusChanged() {
    state = state.copyWith(name: state.name.onFocusChange());
  }

  Future<void> onSubmit() async {
    state = state.copyWith(name: state.name.onSubmit());
    if (!state.isValidAll) {
      return;
    }
    final updatedTask = state.initTask.updateName(state.name.text);
    await _read(loadingProvider.notifier).run(() async {
      final uid = _read(authStreamProvider).value?.uid;
      if (uid == null) {
        state = state.copyWith(name: state.name.addServerError('エラーが発生しました'));
      } else {
        await _read(taskRepositoryFamily(uid)).update(updatedTask);
        updatedTask.isDone
            ? _read(doneTasksFamily(uid).notifier).update(updatedTask)
            : _read(todoTasksFamily(uid).notifier).update(updatedTask);
        _refresh(taskFamily(TaskArg(uid: uid, taskId: state.initTask.id)));
        _read(routerProvider.notifier).pop();
      }
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
