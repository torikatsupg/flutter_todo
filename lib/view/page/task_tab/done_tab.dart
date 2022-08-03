import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/done_tab_controller.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/util/async_value.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoneTab extends ConsumerWidget {
  const DoneTab({super.key});

  @override
  Widget build(context, ref) {
    final userId = ref.watch(localAuthProvider).userId;
    final state = ref.watch(doneTabControllerFamily(userId));
    final controller = ref.read(doneTabControllerFamily(userId).notifier);

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
                (context, index) {
                  return ProviderScope(
                    overrides: [
                      doneTaskListItemProvider.overrideWithValue(
                        list.list[index],
                      ),
                    ],
                    child: const _ListItem(),
                  );
                },
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
                    onPressed: controller.resolveAndLoadMore,
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
  const _ListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(doneTaskListItemProvider);
    final userId = ref.read(localAuthProvider).userId;
    final controller = ref.read(doneTabControllerFamily(userId).notifier);

    return ListTile(
      leading: Text(task.id.value),
      title: Text(task.name),
      onTap: () => controller.onTapListItem(task.id.value),
    );
  }
}
