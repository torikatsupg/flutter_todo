import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/util/list_cache_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part '../../generated/provider/controller/todo_tab_controller.freezed.dart';

final todoTabControllerProvider =
    StateNotifierProvider.autoDispose<TodoTabController, _TodoTabState>(
  (ref) {
    final uid = ref.watch(authProvider).uid;
    final provider = todoTasksFamily(uid);
    ref.read(provider.notifier).initialize();
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >
          scrollController.position.maxScrollExtent - 100) {
        ref.read(provider.notifier).loadMore();
      }
    });
    final controller = TodoTabController(
      ref.read,
      provider,
      ref.read(provider),
      scrollController,
    );
    ref.listen<ListCacheState<Task>>(
      provider,
      (_, next) => controller.onChagneList(next),
    );
    return controller;
  },
);

class TodoTabController extends StateNotifier<_TodoTabState> {
  TodoTabController(this._read, this.provider, ListCacheState<Task> list,
      ScrollController scrollController)
      : super(_TodoTabState(list: list, scrollController: ScrollController()));

  final Reader _read;
  final AutoDisposeStateNotifierProvider<ListCacheController<Task>,
      ListCacheState<Task>> provider;

  void onChagneList(ListCacheState<Task> list) =>
      state = state.copyWith(list: list);

  Future<void> refresh() => _read(provider.notifier).refresh();

  Future<void> resolveAndLoadMore() => _read(provider.notifier).loadMore();
}

@freezed
class _TodoTabState with _$_TodoTabState {
  factory _TodoTabState({
    required ListCacheState<Task> list,
    required ScrollController scrollController,
  }) = __TodoTabState;

  _TodoTabState._();
}
