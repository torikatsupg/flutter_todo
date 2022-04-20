import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/done_tab_controller.dart';
import 'package:flutter_todo/provider/controller/task_controller_provider.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
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
    final state = ref.watch(doneTabControllerProvider);
    final controller = ref.read(taskControllerProvider.notifier);
    return state.map(
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
              onTap: () => controller.toDetailPage(task.id),
            );
          },
        );
      },
      error: (_) => const ErrorView(),
      loading: (_) => const LoadingView(),
    );
  }
}
