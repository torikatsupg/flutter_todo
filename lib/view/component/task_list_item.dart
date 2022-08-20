import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/global_controller/date_format_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListItem extends ConsumerWidget {
  const TaskListItem({required this.task, required this.onTap, super.key});

  final Task task;
  final void Function(Task) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ),
      ),
      child: ListTile(
        leading: Text(task.name),
        trailing: Text(
          ref.watch(dateFormatProvider).format(task.createdAt),
        ),
        onTap: () => onTap(task),
      ),
    );
  }
}
