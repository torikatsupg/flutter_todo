import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/util/pagenated_list_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/model/task_provider.freezed.dart';

final todoTasksFamily = StateNotifierProvider.family<
    PagenatedListController<Task, FirestoreError>,
    AsyncValue<PagenatedList<Task, FirestoreError>>,
    String>(
  (ref, uid) =>
      PagenatedListController(ref.watch(taskRepositoryFamily(uid)).findAllTodo),
);

final doneTasksFamily = StateNotifierProvider.family<
    PagenatedListController<Task, FirestoreError>,
    AsyncValue<PagenatedList<Task, FirestoreError>>,
    String>(
  (ref, uid) =>
      PagenatedListController(ref.watch(taskRepositoryFamily(uid)).findAllDone),
);

final taskFamily =
    FutureProvider.family<Result<Task, FirestoreError>, TaskArg>(
  (ref, arg) => ref.watch(taskRepositoryFamily(arg.uid)).findById(arg.id),
);

@freezed
class TaskArg with _$TaskArg {
  factory TaskArg({
    required String uid,
    required String id,
  }) = _TaskArg;

  TaskArg._();
}
