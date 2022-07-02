import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:flutter_todo/util/list_cache_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/done_tab_controller.freezed.dart';

final doneTabControllerProvider =
    StateNotifierProvider<DoneTabController, _DoneTabState>(
  (ref) {
    final uid = ref.read(authProvider).uid;
    final controller = DoneTabController(ref, uid);
    // avoid modify provider during their initialization
    Future.delayed(const Duration(microseconds: 1)).then(
      (_) => ref.read(doneTasksFamily(uid).notifier).initialize(),
    );
    return controller;
  },
);

class DoneTabController extends StateNotifier<_DoneTabState> {
  DoneTabController(Ref ref, this._uid)
      : super(_DoneTabState(
          list: ref.read(doneTasksFamily(_uid)),
          scrollController: ScrollController(),
        )) {
    _read = ref.read;

    state.scrollController.addListener(() {
      // TODO(torikatsu): fix conditions
      if (state.scrollController.offset >
          state.scrollController.position.maxScrollExtent - 100) {
        _read(doneTasksFamily(_uid).notifier).loadMore();
      }
    });

    ref.listen<ListCacheState<Task>>(
        doneTasksFamily(_uid), (_, next) => onChagneList(next));
  }

  late final Reader _read;
  final String _uid;

  void onChagneList(ListCacheState<Task> list) =>
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
    required ListCacheState<Task> list,
    required ScrollController scrollController,
  }) = __DoneTabState;

  _DoneTabState._();
}
