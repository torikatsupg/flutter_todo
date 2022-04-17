import 'package:flutter/material.dart';
import 'package:flutter_todo/component/error_view.dart';
import 'package:flutter_todo/component/loading_view.dart';
import 'package:flutter_todo/provider/fetch/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoneTab extends ConsumerStatefulWidget {
  const DoneTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoneTabState();
}

class _DoneTabState extends ConsumerState {
  final _controller = ScrollController();

  @override
  Widget build(context) {
    return ref.watch(doneTasksProvider).map(
          data: (data) {
            final tasks = data.value;
            return ListView.builder(
              controller: _controller,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  leading: Text(task.id),
                  title: Text(task.name),
                  onTap: () => ref
                      .read(routerProvider.notifier)
                      .go('/home/todo/${task.id}'),
                );
              },
            );
          },
          error: (_) => const ErrorView(),
          loading: (_) => const LoadingView(),
        );
  }
}
