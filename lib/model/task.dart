import 'package:flutter_todo/model/query_list.dart';
import 'package:flutter_todo/model/result.dart';
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

abstract class TaskRepository<C extends Cursor, Err> {
  Future<Result<QueryList<Task, C>, Err>> findAllTodo([C? cursor]);
  Future<Result<QueryList<Task, C>, Err>> findAllDone([C? cursor]);
  Future<Result<Task?, Err>> findById(String id);
  Future<Result<Task, Err>> insert({required String name});
  Future<Result<void, Err>> update(Task task);
}
