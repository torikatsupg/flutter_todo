import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/global_controller/date_format_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/view/component/task_list_item.dart';
import 'package:flutter_todo/view/page/task_tab/todo_tab_controller.dart';
import 'package:flutter_todo/provider/local/local_provider.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoTab extends ConsumerWidget {
  const TodoTab({super.key});

  @override
  Widget build(context, ref) {
    final userId = ref.watch(localUserProvider).userId;
    final list = ref.watch(todoTasksFamily(userId));

    return list.maybeFlatMap<Widget>(
      data: (list) => RefreshIndicator(
        // TODO(torikatsu): apply web
        onRefresh: ref.read(todoTasksFamily(userId).notifier).refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: ref.watch(todoTabControllerProvider(userId)),
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
                (context, index) => _ListItem(
                  list.list[index],
                ),
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
                      onPressed:
                          ref.read(todoTasksFamily(userId).notifier).loadMore,
                      child: const Text('retry'),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
      loading: LoadingView.new,
      orElse: const ErrorView(),
    );
  }
}

class _ListItem extends ConsumerWidget {
  const _ListItem(this.task);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(task.id),
      onDismissed: (_) {
        final userId = ref.read(localUserProvider).userId;
        ref
            .read(todoTabControllerProvider(userId).notifier)
            .onDismissedItem(task);
      },
      child: TaskListItem(
        task: task,
        onTap: (task) {
          ref.read(routerProvider).goNamed_(
            Routes.taskDetail,
            params: {
              ParamKeys.tab: HomeTab.task.value,
              ParamKeys.taskId: task.id.value,
            },
          );
        },
      ),
    );
  }
}
