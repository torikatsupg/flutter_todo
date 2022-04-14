import 'package:flutter/material.dart';
import 'package:flutter_todo/component/error_view.dart';
import 'package:flutter_todo/component/loading_view.dart';
import 'package:flutter_todo/component/not_found_view.dart';
import 'package:flutter_todo/provider/fetch/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final maybeTask = ref.watch(currentTaskProvider);
    final id = ref.watch(idProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: maybeTask.map(
        data: (data) {
          final task = maybeTask.value;
          if (task == null) {
            return const NotFoundView();
          } else {
            return Column(
              children: [
                Text(task.id),
                Text(task.name),
                Text(task.createdAt.toIso8601String()),
                Text(task.isDone.toString()),
                TextButton(
                  child: const Text('to edit'),
                  onPressed: () => ref
                      .read(routerProvider.notifier)
                      .go('/home/todo/$id/edit'),
                ),
              ],
            );
          }
        },
        error: (_) => const ErrorView(),
        loading: (_) => const LoadingView(),
      ),
    );
  }
}
