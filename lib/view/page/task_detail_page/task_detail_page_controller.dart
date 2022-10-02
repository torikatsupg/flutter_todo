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
  (ref, args) => TaskDetailController(args.v1, args.v2),
);

class TaskDetailController extends AsyncNotifier<Result<Task, FirestoreError>> {
  TaskDetailController(this._userId, this._taskId) : super();

  final UserId _userId;
  final TaskId _taskId;

  @override
  Future<Result<Task, FirestoreError>> build() async {
    return ref.watch(taskFamily(T2(_userId, _taskId)).future);
  }

  void toEditPage() => state.flatWhenData(
        (task) => ref.read(routerProvider).goNamed_(
          Routes.taskEdit,
          params: {
            ParamKeys.tab: HomeTab.task.value,
            ParamKeys.taskId: task.id.value,
          },
        ),
      );
}

