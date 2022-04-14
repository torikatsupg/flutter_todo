import 'package:flutter_todo/firebase/task_repository_provider.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoTaskProvider = FutureProvider<List<Task>>(
    (ref) => ref.watch(taskRepositoryProvider).findAllTodo());

final doneTaskProvider = FutureProvider<List<Task>>(
    (ref) => ref.watch(taskRepositoryProvider).findAllDone());
