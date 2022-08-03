import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:flutter_todo/util/tupple.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskDetailFamily = StateNotifierProvider.autoDispose.family<
    TaskDetailController,
    AsyncValue<Result<Task, FirestoreError>>,
    T2<UserId, TaskId>>(
  (ref, args) => TaskDetailController(
    ref.read,
    ref.watch(taskFamily(args)),
  ),
);

class TaskDetailController
    extends StateNotifier<AsyncValue<Result<Task, FirestoreError>>> {
  // ignore: no_leading_underscores_for_local_identifiers
  TaskDetailController(this._read, super._state);

  final Reader _read;

  void toEditPage() => state.flatWhenData((task) =>
      _read(routerProvider).go_('/home/todo/${task.id.value}/edit', _read));
}
