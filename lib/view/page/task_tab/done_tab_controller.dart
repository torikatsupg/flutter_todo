import 'package:flutter/widgets.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
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

class DoneTabController extends StateNotifier<_DoneTabState> {
  DoneTabController(Ref ref, this._userId)
      : _read = ref.read,
        super(
          _DoneTabState(
            list: ref.read(doneTasksFamily(_userId)),
            scrollController: ScrollController(),
          ),
        ) {
    state.scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.scrollController.offset >
          state.scrollController.position.maxScrollExtent - 100) {
        _read(doneTasksFamily(_userId).notifier).loadMore();
      }
    });

    ref.listen<AsyncPagenatedList<Task, FirestoreError>>(
        doneTasksFamily(_userId), (_, next) => onChagneList(next));
  }

  final Reader _read;
  final UserId _userId;

  void onChagneList(AsyncPagenatedList<Task, FirestoreError> list) =>
      state = state.copyWith(list: list);

  void onTapListItem(String taskId) =>
      _read(routerProvider).go_('/home/todo/$taskId');

  Future<void> refresh() => _read(doneTasksFamily(_userId).notifier).refresh();

  Future<void> resolveAndLoadMore() =>
      _read(doneTasksFamily(_userId).notifier).loadMore();
}

@freezed
class _DoneTabState with _$_DoneTabState {
  factory _DoneTabState({
    required AsyncPagenatedList<Task, FirestoreError> list,
    required ScrollController scrollController,
  }) = __DoneTabState;

  _DoneTabState._();
}