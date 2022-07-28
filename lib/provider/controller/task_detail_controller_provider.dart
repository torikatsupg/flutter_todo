import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskDetailFamily = StateNotifierProvider.autoDispose.family<
    TaskDetailController,
    AsyncValue<Result<Task, FirestoreError>>,
    String>(TaskDetailController.new);

class TaskDetailController
    extends StateNotifier<AsyncValue<Result<Task, FirestoreError>>> {
  TaskDetailController(Ref ref, String taskId)
      : super(const AsyncValue.loading()) {
    _read = ref.read;
    init(ref, taskId);
  }

  late final Reader _read;

  Future<void> init(Ref ref, String taskId) async {
    final uid = ref.read(authProvider).uid;
    final result =
        await ref.read(taskFamily(TaskArg(uid: uid, id: taskId)).future);
    state = AsyncValue.data(result);
  }

  void toEditPage() => state.flatWhenData((task) =>
      _read(routerProvider.notifier).go('/home/todo/${task.id}/edit'));
}
