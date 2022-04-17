import 'package:flutter_todo/firebase/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_todo/firebase/task_repository_provider.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';

final todoTasksProvider = FutureProvider.autoDispose<List<Task>>(
  (ref) {
    final uid = ref.watch(authProvider.select((user) => user.uid));
    return ref.watch(taskRepositoryFamily(uid)).findAllTodo();
  },
);

final doneTasksProvider = FutureProvider.autoDispose<List<Task>>(
  (ref) {
    final uid = ref.watch(authProvider.select((user) => user.uid));
    return ref.watch(taskRepositoryFamily(uid)).findAllDone();
  },
);

final taskProvider = FutureProvider.autoDispose<Task?>((ref) {
  final uid = ref.watch(authProvider).uid;
  final id = ref.watch(idProvider);
  return ref.watch(taskRepositoryFamily(uid)).findById(id);
});
