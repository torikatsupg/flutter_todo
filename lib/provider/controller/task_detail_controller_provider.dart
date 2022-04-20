import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final prepareTaskDetailControllerProvider =
    FutureProvider.autoDispose<Task?>((ref) async {
  final uid = ref.watch(authProvider).uid;
  final id = ref.watch(idProvider);
  return ref.watch(taskFamily(TaskArg(uid: uid, id: id)).future);
});

final taskDetailControllerProvider =
    StateNotifierProvider.autoDispose<TaskDetailController, Task>(
        (_) => throw UnimplementedError());

final taskDetailControllerFamily = StateNotifierProvider.autoDispose
    .family<TaskDetailController, Task, Task>(
        (ref, task) => TaskDetailController(ref, task));

class TaskDetailController extends StateNotifier<Task> {
  TaskDetailController(this._ref, Task state) : super(state);

  final Ref _ref;

  void toEditPage() =>
      _ref.read(routerProvider.notifier).go('/home/todo/${state.id}/edit');
}
