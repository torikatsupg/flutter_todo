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

abstract class TaskRepository {
  Future<List<Task>> findAllTodo();
  Future<List<Task>> findAllDone();
  Future<Task> findById(String id);
  Future<void> insert({required String name});
  Future<void> update(Task task);
}
