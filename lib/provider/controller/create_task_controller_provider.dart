import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/create_task_controller_provider.freezed.dart';

final createTaskController =
    StateNotifierProvider.autoDispose<CreateTaskController, _CreateTaskState>(
        (ref) => CreateTaskController(ref));

class CreateTaskController extends StateNotifier<_CreateTaskState> {
  CreateTaskController(this._ref)
      : super(_CreateTaskState(name: createFormModel(mandatoryValidator))) {
    state.name.setListeners(onFocusChangeName, onChangeName);
  }

  final Ref _ref;

  onFocusChangeName() =>
      state = state.copyWith(name: state.name.onFocusChange());
  onChangeName() => state = state.copyWith(name: state.name.onChangeText());

  Future<void> onSubmit() async {
    state = state.onSubmit();
    if (!state.isValidAll) {
      return;
    }
    final uid = _ref.read(authStreamProvider).value?.uid;
    if (uid == null) {
      state = state.copyWith(
        name: state.name.addServerError('エラーが発生しました。'),
      );
    } else {
      await _ref.read(loadingProvider.notifier).run(
        () async {
          await _ref
              .read(taskRepositoryFamily(uid))
              .insert(name: state.name.text);
          _ref.refresh(todoTasksFamily(uid));
          _ref.read(routerProvider.notifier).pop();
        },
      );
    }
  }
}

// TODO(torikatsu): make private
@freezed
class _CreateTaskState with _$_CreateTaskState {
  factory _CreateTaskState({
    required FormModel name,
  }) = __CreateTaskController;

  _CreateTaskState._();

  late final isValidAll = name.isValid;

  _CreateTaskState onSubmit() => copyWith(name: name.onSubmit());
}
