import 'package:flutter_todo/firebase/task_repository_provider.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoTaskProvider = FutureProvider<List<Task>>(
    (ref) => ref.watch(taskRepositoryProvider).findAllTodo());

final doneTaskProvider = FutureProvider<List<Task>>(
    (ref) => ref.watch(taskRepositoryProvider).findAllDone());

final currentTaskProvider = FutureProvider.autoDispose<Task?>(
  (ref) async {
    final currentId = ref.watch(idProvider);
    final results = await Future.wait<List<Task>>([
      ref.watch(todoTaskProvider.future),
      ref.watch(doneTaskProvider.future),
    ]);
    final maybeTodo= results[0].where((e) => e.id == currentId);
    if (maybeTodo.isNotEmpty) {
      return maybeTodo.first;
    }
    final maybeDone = results[1].where((e) => e.id == currentId);
    if (maybeDone.isNotEmpty) {
      return maybeDone.first;
    }
    return null;
  },
);
