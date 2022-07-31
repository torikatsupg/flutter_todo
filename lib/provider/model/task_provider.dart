import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/user_auth.dart';
import 'package:flutter_todo/util/pagenated_list_controller.dart';
import 'package:flutter_todo/util/tupple.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/model/task.dart';

final todoTasksFamily = StateNotifierProvider.family<
    PagenatedListController<Task, FirestoreError>,
    AsyncPagenatedList<Task, FirestoreError>,
    UserId>(
  (ref, userId) => PagenatedListController(
    ref.watch(taskRepositoryFamily(userId)).findAllTodo,
  ),
);

final doneTasksFamily = StateNotifierProvider.family<
    PagenatedListController<Task, FirestoreError>,
    AsyncPagenatedList<Task, FirestoreError>,
    UserId>(
  (ref, userId) => PagenatedListController(
    ref.watch(taskRepositoryFamily(userId)).findAllDone,
  ),
);

final taskFamily =
    FutureProvider.family<Result<Task, FirestoreError>, T2<UserId, TaskId>>(
  (ref, arg) => ref.watch(taskRepositoryFamily(arg.v1)).findById(arg.v2),
);
