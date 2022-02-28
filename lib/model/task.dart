import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({required String id}) = _Task;

  Task._();
}
