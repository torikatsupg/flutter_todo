import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final doneTabControllerProvider = FutureProvider.autoDispose<List<Task>>((ref) async {
  final uid = ref.watch(authProvider).uid;
  return await ref.watch(todoTasksFamily(uid).future);
});
