import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/util/list_cache_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/done_tab_controller.freezed.dart';

final doneTabControllerProvider =
    StateNotifierProvider.autoDispose<DoneTabController, _DoneTabState>(
  (ref) {
    final uid = ref.watch(authProvider).uid;
    final scrollController = ScrollController();
    scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (scrollController.offset >
          scrollController.position.maxScrollExtent - 100) {
        ref.read(todoTasksFamily(uid).notifier).loadMore();
      }
    });
    final controller = DoneTabController(ref.read, uid, scrollController);
    ref.listen<ListCacheState<Task>>(
      todoTasksFamily(uid),
      (_, next) => controller.onChagneList(next),
    );
    // avoid modify provider during their initialization
    Future.delayed(const Duration(microseconds: 1))
        .then((_) => ref.read(doneTasksFamily(uid).notifier).initialize());
    return controller;
  },
);

class DoneTabController extends StateNotifier<_DoneTabState> {
  DoneTabController(this._read, this._uid, scrollController)
      : super(_DoneTabState(
            list: _read(todoTasksFamily(_uid)),
            scrollController: ScrollController()));

  final Reader _read;
  final String _uid;

  void onChagneList(ListCacheState<Task> list) =>
      state = state.copyWith(list: list);

  Future<void> refresh() => _read(todoTasksFamily(_uid).notifier).refresh();

  Future<void> resolveAndLoadMore() =>
      _read(todoTasksFamily(_uid).notifier).loadMore();
}

@freezed
class _DoneTabState with _$_DoneTabState {
  factory _DoneTabState({
    required ListCacheState<Task> list,
    required ScrollController scrollController,
  }) = __DoneTabState;

  _DoneTabState._();
}
