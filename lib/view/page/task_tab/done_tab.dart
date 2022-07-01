import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/done_tab_controller.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoneTab extends ConsumerWidget {
  const DoneTab({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(doneTabControllerProvider);
    final controller = ref.read(doneTabControllerProvider.notifier);

    return state.list.map(
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
                  final task = list.items[index];
                  return ListTile(
                    leading: Text(task.id),
                    title: Text(task.name),
                    onTap: () => controller.onTapListItem(task.id),
                  );
                },
                childCount: list.items.length,
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
      error: (e) => const ErrorView(),
      loading: (_) => const LoadingView(),
    );
  }
}
