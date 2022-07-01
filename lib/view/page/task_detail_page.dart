import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/task_detail_controller_provider.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/view/component/not_found_view.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final task = ref.watch(prepareTaskDetailControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.read(idProvider)),
      ),
      body: task.map(
        data: (data) {
          final task = data.value;
          return task == null
              ? const NotFoundView()
              : ProviderScope(
                  overrides: [
                    taskDetailControllerProvider
                        .overrideWithProvider(taskDetailControllerFamily(task))
                  ],
                  child: const TaskDetailView(),
                );
        },
        error: (_) => const ErrorView(),
        loading: (_) => const LoadingView(),
      ),
    );
  }
}

class TaskDetailView extends ConsumerWidget {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskDetailControllerProvider);
    final controller = ref.read(taskDetailControllerProvider.notifier);
    return Column(
      children: [
        Text(task.id),
        Text(task.name),
        Text(task.createdAt.toIso8601String()),
        Text(task.isDone.toString()),
        TextButton(
          child: const Text('to edit'),
          onPressed: controller.toEditPage,
        ),
      ],
    );
  }
}
