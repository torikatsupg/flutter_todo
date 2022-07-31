import 'package:flutter_todo/model/user_auth.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/create_task_controller_provider.freezed.dart';

final createTaskControllerFamily = StateNotifierProvider.autoDispose
    .family<CreateTaskController, _CreateTaskState, UserId>(
  CreateTaskController.new,
);

class CreateTaskController extends StateNotifier<_CreateTaskState> {
  CreateTaskController(Ref ref, this.userId)
      : _read = ref.read,
        super(_CreateTaskState(name: createFormModel(mandatoryValidator))) {
    state.name.setListeners(onFocusChangeName, onChangeName);
  }

  final Reader _read;
  final userId;

  onFocusChangeName() =>
      state = state.copyWith(name: state.name.onFocusChange());
  onChangeName() => state = state.copyWith(name: state.name.onChangeText());

  Future<void> onSubmit() async {
    state = state.onSubmit();
    if (!state.isValidAll) {
      return;
    }
    await _read(loadingProvider.notifier).run(
      () async {
        final result = await _read(taskRepositoryFamily(userId))
            .insert(name: state.name.text);
        result.map(
          ok: (data) {
            _read(todoTasksFamily(userId).notifier).insert(data.value);
            _read(routerProvider).pop_(_read);
          },
          err: (e) {
            // TODO(torikatsu): handle error.
          },
        );
      },
    );
  }
}

@freezed
class _CreateTaskState with _$_CreateTaskState {
  factory _CreateTaskState({
    required FormModel name,
  }) = __CreateTaskController;

  _CreateTaskState._();

  late final isValidAll = name.isValid;

  _CreateTaskState onSubmit() => copyWith(name: name.onSubmit());
}
