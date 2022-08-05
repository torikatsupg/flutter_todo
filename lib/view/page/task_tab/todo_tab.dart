import 'package:flutter/material.dart';
import 'package:flutter_todo/view/page/task_tab/todo_tab_controller.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoTab extends ConsumerWidget {
  const TodoTab({super.key});

  @override
  Widget build(context, ref) {
    final userId = ref.watch(localUserProvider).userId;
    final state = ref.watch(todoTabControllerProvider(userId));
    final controller = ref.read(todoTabControllerProvider(userId).notifier);

    return state.list.flatMap<Widget>(
      data: (list) => RefreshIndicator(
        // TODO(torikatsu): apply web
        onRefresh: controller.refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: state.scrollController,
          slivers: [
            if (list.hasRefreshError)
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: Text('error has occured'),
                  ),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: list.list.length,
                (context, index) {
                  return ProviderScope(
                    overrides: [
                      todoTaskListItemProvider
                          .overrideWithValue(list.list[index])
                    ],
                    child: const _ListItem(),
                  );
                },
              ),
            ),
            if (list.isMoreLoading)
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            else if (list.hasLoadMoreError)
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: TextButton(
                      onPressed: controller.resolveAndLoadMore,
                      child: const Text('retry'),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
      loading: LoadingView.new,
      orElse: ErrorView.new,
    );
  }
}

class _ListItem extends ConsumerWidget {
  const _ListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(todoTaskListItemProvider);
    final userId = ref.read(localUserProvider).userId;
    final controller = ref.read(todoTabControllerProvider(userId).notifier);

    return Dismissible(
      key: ValueKey(task.id),
      onDismissed: ((_) => controller.onDismissedItem(task)),
      child: ListTile(
        leading: Text(task.id.value),
        title: Text(task.name),
        onTap: () => controller.onPressItem(task.id),
      ),
    );
  }
}
