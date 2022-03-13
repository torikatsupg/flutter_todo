import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/task.freezed.dart';

abstract class Task {
  abstract final String id;
  abstract final String name;
}

@freezed
class TodoTask with _$TodoTask {
  @Implements<Task>()
  factory TodoTask({required String id, required String name}) = _TodoTask;
  TodoTask._();
}

@freezed
class DoneTask with _$DoneTask {
  @Implements<Task>()
  factory DoneTask({required String id, required String name}) = _DoneTask;
  DoneTask._();
}
