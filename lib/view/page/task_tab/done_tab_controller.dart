import 'package:flutter/widgets.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/util/pagenated_list_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../../generated/view/page/task_tab/done_tab_controller.freezed.dart';

final doneTabControllerFamily =
    StateNotifierProvider.family<DoneTabController, _DoneTabState, UserId>(
  DoneTabController.new,
);

final doneTaskListItemProvider = Provider<Task>(
  (ref) => throw UnimplementedError(),
);

// TODO(torikatsu): remove pagenated list;
class DoneTabController extends StateNotifier<_DoneTabState> {
  DoneTabController(this._ref, this._userId)
      : super(
          _DoneTabState(
            list: _ref.read(doneTasksFamily(_userId)),
            scrollController: ScrollController(),
          ),
        ) {
    state.scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.scrollController.offset >
          state.scrollController.position.maxScrollExtent - 100) {
        _ref.read(doneTasksFamily(_userId).notifier).loadMore();
      }
    });

    _ref.listen<AsyncPagenatedList<Task, FirestoreError>>(
        doneTasksFamily(_userId), (_, next) => onChagneList(next));
  }

  final Ref _ref;
  final UserId _userId;

  void onChagneList(AsyncPagenatedList<Task, FirestoreError> list) =>
      state = state.copyWith(list: list);

  void onTapListItem(TaskId taskId) => _ref.read(routerProvider).goNamed_(
        Routes.taskDetail,
        params: {
          ParamKeys.tab: HomeTab.task.value,
          ParamKeys.taskId: taskId.value,
        },
      );

  Future<void> refresh() =>
      _ref.read(doneTasksFamily(_userId).notifier).refresh();

  Future<void> resolveAndLoadMore() =>
      _ref.read(doneTasksFamily(_userId).notifier).loadMore();

  @override
  void dispose() {
    super.dispose();
    state.dispose();
  }
}

@freezed
class _DoneTabState with _$_DoneTabState {
  factory _DoneTabState({
    required AsyncPagenatedList<Task, FirestoreError> list,
    required ScrollController scrollController,
  }) = __DoneTabState;

  _DoneTabState._();

  void dispose() {
    scrollController.dispose();
  }
}
