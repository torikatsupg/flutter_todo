import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoTabControllerProvider = StateNotifierProvider.autoDispose<
    TodoTabController, AsyncValue<List<Task>>>((ref) {
  final uid = ref.watch(authProvider).uid;
  final tasks = ref.watch(todoTasksFamily(uid));
  return TodoTabController(ref, uid, tasks);
});

class TodoTabController extends StateNotifier<AsyncValue<List<Task>>> {
  TodoTabController(this._ref, this._uid, AsyncValue<List<Task>> state)
      : super(state);

  final Ref _ref;
  final String _uid;

  Future<void> onRefresh() async {
    _ref.refresh(todoTasksFamily(_uid));
  }

  void toDetailPage(String id) =>
      _ref.read(routerProvider.notifier).go('/home/todo/$id');
}
