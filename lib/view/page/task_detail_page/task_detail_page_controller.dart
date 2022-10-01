import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:flutter_todo/util/tupple.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskDetailFamily = StateNotifierProvider.autoDispose.family<
    TaskDetailController,
    AsyncValue<Result<Task, FirestoreError>>,
    T2<UserId, TaskId>>(
  (ref, args) => TaskDetailController(
    ref,
    ref.watch(taskFamily(args)),
  ),
);

class TaskDetailController
    extends StateNotifier<AsyncValue<Result<Task, FirestoreError>>> {
  TaskDetailController(this._ref, super._state);

  final Ref _ref;

  void toEditPage() => state.flatWhenData(
        (task) => _ref.read(routerProvider).goNamed_(
          Routes.taskEdit,
          params: {
            ParamKeys.tab: HomeTab.task.value,
            ParamKeys.taskId: task.id.value,
          },
        ),
      );
}
