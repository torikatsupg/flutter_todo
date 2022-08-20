import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/view/component/task_list_item.dart';
import 'package:flutter_todo/view/page/task_tab/done_tab_controller.dart';
import 'package:flutter_todo/provider/local/local_provider.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoneTab extends ConsumerWidget {
  const DoneTab({super.key});

  @override
  Widget build(context, ref) {
    final userId = ref.watch(localUserProvider).userId;
    final state = ref.watch(doneTabControllerFamily(userId));
    final list = ref.watch(doneTasksFamily(userId));

    return list.flatMap<Widget>(
      data: (list) => RefreshIndicator(
        // TODO(torikatsu): apply web
        onRefresh: ref.read(doneTasksFamily(userId).notifier).refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: state,
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
                (context, index) => _ListItem(list.list[index]),
                childCount: list.list.length,
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
                        ref.read(doneTasksFamily(userId).notifier).loadMore,
                    child: const Text('retry'),
                  )),
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
  const _ListItem(this.task);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TaskListItem(
      key: ValueKey(task.id),
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
    );
  }
}
