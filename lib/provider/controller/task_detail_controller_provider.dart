import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskDetailFamily = StateNotifierProvider.autoDispose.family<
    TaskDetailController,
    AsyncValue<Result<Task, FirestoreError>>,
    TaskId>(TaskDetailController.new);

class TaskDetailController
    extends StateNotifier<AsyncValue<Result<Task, FirestoreError>>> {
  TaskDetailController(Ref ref, TaskId taskId)
      : _read = ref.read,
        super(const AsyncValue.loading()) {
    init(ref, taskId);
  }

  final Reader _read;

  Future<void> init(Ref ref, TaskId taskId) async {
    final uid = ref.read(authProvider).uid;
    final result =
        await ref.read(taskFamily(TaskArg(uid: uid, taskId: taskId)).future);
    state = AsyncValue.data(result);
  }

  void toEditPage() => state.flatWhenData((task) =>
      _read(routerProvider).go_('/home/todo/${task.id.value}/edit', _read));
}
