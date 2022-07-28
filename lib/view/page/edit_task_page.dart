import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/view/component/not_found_view.dart';
import 'package:flutter_todo/provider/controller/task_edit_controller_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/util/async_value.dart';

class EditTaskPage extends ConsumerWidget {
  const EditTaskPage(this.id, {super.key});

  final String id;

  @override
  Widget build(context, ref) {
    final state = ref.watch(prepareTaskEditProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: state.flatMap(
        data: _EditView.new,
        loading: LoadingView.new,
        notFound: NotFoundView.new,
        error: ErrorView.new,
      ),
    );
  }
}

class _EditView extends ConsumerWidget {
  const _EditView(this.task);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskEditControllerFamily(task));
    final controller = ref.read(taskEditControllerFamily(task).notifier);
    return Column(
      children: [
        TextField(
          controller: state.name.controller,
          focusNode: state.name.focusNode,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: state.name.errors,
            hintText: 'task name',
            helperText: 'task name',
            label: const Text('task name'),
          ),
        ),
        ElevatedButton(
          onPressed: controller.onSubmit,
          child: const Text('submit'),
        ),
      ],
    );
  }
}
