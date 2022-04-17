import 'package:flutter_todo/firebase/datastore/task_repository_impl.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskRepositoryFamily = Provider.family
    .autoDispose<TaskRepository, String>((ref, uid) => TaskRepositoryImpl(uid));
