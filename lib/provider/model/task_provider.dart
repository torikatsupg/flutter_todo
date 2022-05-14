import 'package:flutter_todo/infrastructure/task_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/model/task_provider.freezed.dart';

final todoTasksFamily = FutureProvider.autoDispose
    .family<QueryList<Task, CursorImpl>, TasksArg>((ref, arg) {
  return ref.watch(taskRepositoryFamily(arg.uid)).findAllTodo(arg.cursor);
});

final doneTasksFamily = FutureProvider.autoDispose
    .family<QueryList<Task, CursorImpl>, TasksArg>((ref, arg) {
  return ref.watch(taskRepositoryFamily(arg.uid)).findAllDone(arg.cursor);
});

final taskFamily = FutureProvider.autoDispose.family<Task?, TaskArg>(
  (ref, arg) => ref.watch(taskRepositoryFamily(arg.uid)).findById(arg.id),
);

@freezed
class TasksArg with _$TasksArg {
  factory TasksArg({
    required String uid,
    CursorImpl? cursor,
  }) = _TasksArg;

  TasksArg._();
}

@freezed
class TaskArg with _$TaskArg {
  factory TaskArg({
    required String uid,
    required String id,
  }) = _TaskArg;

  TaskArg._();
}
