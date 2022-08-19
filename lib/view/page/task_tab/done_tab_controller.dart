import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final doneTabControllerFamily =
    StateNotifierProvider.family<DoneTabController, ScrollController, UserId>(
  DoneTabController.new,
);

// TODO(torikatsu): remove pagenated list;
class DoneTabController extends StateNotifier<ScrollController> {
  DoneTabController(this._ref, this._userId) : super(ScrollController()) {
    state.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.offset > state.position.maxScrollExtent - 100) {
        _ref.read(doneTasksFamily(_userId).notifier).loadMore();
      }
    });
  }

  final Ref _ref;
  final UserId _userId;

  @override
  void dispose() {
    super.dispose();
    state.dispose();
  }
}
