import 'package:flutter_todo/firebase/auth_provider.dart';
import 'package:flutter_todo/firebase/datastore/task_repository_impl.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskRepositoryProvider = Provider<TaskRepository>(
// TODO(torikatsu): handle null
  (ref) => TaskRepositoryImpl(ref.watch(authProvider)?.uid ?? ''),
);
