import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskDetailFamily = StateNotifierProvider.autoDispose
    .family<TaskDetailController, AsyncValue<Task>, String>(
  (ref, id) => TaskDetailController(ref, id),
);

class TaskDetailController extends StateNotifier<AsyncValue<Task>> {
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
    state = result.map(
      ok: (data) => AsyncValue.data(data.value),
      err: AsyncValue.error,
    );
  }

  void toEditPage() => state.whenData((task) =>
      _read(routerProvider.notifier).go('/home/todo/${task.id}/edit'));
}
