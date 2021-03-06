import 'package:flutter_todo/infrastructure/cursor_impl.dart';
import 'package:flutter_todo/infrastructure/task_repository_impl.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskRepositoryFamily =
    Provider.family<TaskRepository<CursorImpl>, String>(
  (ref, uid) => TaskRepositoryImpl(uid),
);
