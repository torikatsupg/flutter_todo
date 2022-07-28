import 'package:flutter/widgets.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:flutter_todo/util/pagenated_list_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/done_tab_controller.freezed.dart';

final doneTabControllerProvider =
    StateNotifierProvider<DoneTabController, _DoneTabState>(
  (ref) => DoneTabController(
    ref,
    ref.read(authProvider).uid,
  ),
);

class DoneTabController extends StateNotifier<_DoneTabState> {
  DoneTabController(Ref ref, this._uid)
      : _read = ref.read,
        super(
          _DoneTabState(
            list: ref.read(doneTasksFamily(_uid)),
            scrollController: ScrollController(),
          ),
        ) {
    state.scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.scrollController.offset >
          state.scrollController.position.maxScrollExtent - 100) {
        _read(doneTasksFamily(_uid).notifier).loadMore();
      }
    });

    ref.listen<AsyncPagenatedList<Task, FirestoreError>>(
        doneTasksFamily(_uid), (_, next) => onChagneList(next));
  }

  final Reader _read;
  final String _uid;

  void onChagneList(AsyncPagenatedList<Task, FirestoreError> list) =>
      state = state.copyWith(list: list);

  void onTapListItem(String taskId) =>
      _read(routerProvider.notifier).go('/home/todo/$taskId');

  Future<void> refresh() => _read(doneTasksFamily(_uid).notifier).refresh();

  Future<void> resolveAndLoadMore() =>
      _read(doneTasksFamily(_uid).notifier).loadMore();
}

@freezed
class _DoneTabState with _$_DoneTabState {
  factory _DoneTabState({
    required AsyncPagenatedList<Task, FirestoreError> list,
    required ScrollController scrollController,
  }) = __DoneTabState;

  _DoneTabState._();
}
