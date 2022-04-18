import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/task_edit_controller_provider.freezed.dart';

final taskEditControllerProvider =
    StateNotifierProvider.autoDispose<TaskEditController, _TaskEditState>(
        (ref) => throw UnimplementedError());

final taskEditControllerFamily = StateNotifierProvider.autoDispose
    .family<TaskEditController, _TaskEditState, Task>(
        (ref, task) => TaskEditController(ref, task));

class TaskEditController extends StateNotifier<_TaskEditState> {
  TaskEditController(this._ref, Task initTask)
      : super(_TaskEditState(
          initTask: initTask,
          name: createFormModel(mandatoryValidator),
        )) {
    state.name.setListeners(onChangeText, onFocusChanged);
  }

  late final Ref _ref;

  void onChangeText() {
    state = state.copyWith(name: state.name.onChangeText());
  }

  void onFocusChanged() {
    state = state.copyWith(name: state.name.onFocusChange());
  }

  Future<void> onSubmit() async {
    state = state.copyWith(name: state.name.onSubmit());
    if (!state.isValidAll) {
      return;
    }
    final updatedTask = state.initTask.updateName(state.name.text);
    await _ref.read(loadingProvider.notifier).run(() async {
      final user = _ref.read(authStreamProvider).value;
      if (user == null) {
        state = state.copyWith(name: state.name.addServerError('エラーが発生しました'));
      } else {
        await _ref.read(taskRepositoryFamily(user.uid)).update(updatedTask);
        _ref.refresh(
            updatedTask.isDone ? doneTasksProvider : todoTasksProvider);
        _ref.refresh(taskProvider);

        _ref.read(routerProvider.notifier).pop();
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
