import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/controller/task_detail_controller_provider.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/view/component/not_found_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/util/async_value.dart';

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(context, ref) {
    final state = ref.watch(taskDetailFamily(id));
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: state.flatMap(
        data: TaskDetailView.new,
        loading: LoadingView.new,
        notFound: NotFoundView.new,
        error: ErrorView.new,
      ),
    );
  }
}

class TaskDetailView extends ConsumerWidget {
  const TaskDetailView(this.task, {Key? key}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(taskDetailFamily(task.id).notifier);
    return Column(
      children: [
        Text(task.id),
        Text(task.name),
        Text(task.createdAt.toIso8601String()),
        Text(task.isDone.toString()),
        TextButton(
          onPressed: controller.toEditPage,
          child: const Text('to edit'),
        ),
      ],
    );
  }
}
