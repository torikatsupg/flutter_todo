import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/util/tupple.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/view/component/not_found_view.dart';
import 'package:flutter_todo/view/page/task_detail_page/task_detail_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/util/async_value.dart';

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(context, ref) {
    final userId = ref.watch(localUserProvider).userId;
    final taskId = ref.watch(localTaskIdParamProvier);
    final state = ref.watch(taskDetailFamily(T2(userId, taskId)));
    return Scaffold(
      appBar: AppBar(
        title: Text(taskId.value),
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
  const TaskDetailView(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(localUserProvider).userId;
    return Column(
      children: [
        Text(task.id.value),
        Text(task.name),
        Text(task.createdAt.toIso8601String()),
        Text(task.isDone.toString()),
        TextButton(
          onPressed: ref
              .read(
                taskDetailFamily(
                  T2(
                    userId,
                    task.id,
                  ),
                ).notifier,
              )
              .toEditPage,
          child: const Text('to edit'),
        ),
      ],
    );
  }
}
