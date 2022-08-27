import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../../generated/view/page/create_task_page/create_task_page_controller.freezed.dart';

final createTaskControllerFamily = StateNotifierProvider.autoDispose
    .family<CreateTaskController, _CreateTaskState, UserId>(
  CreateTaskController.new,
);

class CreateTaskController extends StateNotifier<_CreateTaskState> {
  CreateTaskController(this._ref, this.userId)
      : super(_CreateTaskState(name: createFormModel(mandatoryValidator))) {
    state.name.initialize(_onChangeName);
  }

  final Ref _ref;
  final UserId userId;

  _onChangeName(FormModel name) => state = state.copyWith(name: name);

  Future<void> onSubmit() async {
    state = state.onSubmit();
    if (!state.isValidAll) {
      return;
    }
    await _ref.read(loadingProvider.notifier).run(
      () async {
        final result = await _ref
            .read(taskRepositoryFamily(userId))
            .insert(name: state.name.text);
        result.map(
          ok: (data) {
            _ref.read(todoTasksFamily(userId).notifier).insert(data.value);
            _ref.read(routerProvider).goNamed_(
              Routes.home,
              params: {
                ParamKeys.tab: HomeTab.task.value,
              },
            );
          },
          err: (e) {
            // TODO(torikatsu): handle error.
          },
        );
      },
    );
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
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

  void dispose() => name.dispose();
}
