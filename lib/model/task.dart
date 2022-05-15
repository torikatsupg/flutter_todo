import 'package:flutter_todo/model/query_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String id,
    required String name,
    required DateTime createdAt,
    required bool isDone,
  }) = _Task;

  Task._();

  Task done() => copyWith(isDone: true);

  Task updateName(String name) => copyWith(name: name);
}

abstract class TaskRepository<C extends Cursor> {
  Future<QueryList<Task, C>> findAllTodo([C? cursor]);
  Future<QueryList<Task, C>> findAllDone([C? cursor]);
  Future<Task?> findById(String id);
  Future<Task> insert({required String name});
  Future<void> update(Task task);
}
