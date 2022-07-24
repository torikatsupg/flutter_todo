import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/todo_tab_controller.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoTab extends ConsumerWidget {
  const TodoTab({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(todoTabControllerProvider);
    final controller = ref.read(todoTabControllerProvider.notifier);

    return state.list.when<Widget>(
      loading: () => const LoadingView(),
      error: ((error, stackTrace) => const ErrorView()),
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
                  final task = list.list[index];
                  return ListTile(
                    leading: Text(task.id),
                    title: Text(task.name),
                    onTap: () => controller.onPressItem(task.id),
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
    );
  }
}
