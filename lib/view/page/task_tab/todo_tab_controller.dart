import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoTabControllerProvider =
    StateNotifierProvider.family<TodoTabController, ScrollController, UserId>(
  TodoTabController.new,
);

class TodoTabController extends StateNotifier<ScrollController> {
  TodoTabController(this._ref, this._userId) : super(ScrollController()) {
    state.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.offset > state.position.maxScrollExtent - 100) {
        _ref.read(todoTasksFamily(_userId).notifier).loadMore();
      }
    });
  }

  final Ref _ref;
  final UserId _userId;

  Future<void> onDismissedItem(Task task) =>
      _ref.read(loadingProvider.notifier).run(
        () async {
          await _ref.read(taskRepositoryFamily(_userId)).update(task.done());
          _ref.read(todoTasksFamily(_userId).notifier).delete(task);
          _ref.read(doneTasksFamily(_userId).notifier).insert(task);
        },
      );

  @override
  void dispose() {
    super.dispose();
    state.dispose();
  }
}
