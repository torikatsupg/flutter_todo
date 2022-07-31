import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/util/tupple.dart';
import 'package:flutter_todo/view/component/error_view.dart';
import 'package:flutter_todo/view/component/loading_view.dart';
import 'package:flutter_todo/view/component/not_found_view.dart';
import 'package:flutter_todo/provider/controller/task_edit_controller_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/util/async_value.dart';

class EditTaskPage extends ConsumerWidget {
  const EditTaskPage({super.key});

  @override
  Widget build(context, ref) {
    final taskId = ref.watch(localTaskIdParamProvier);
    final userId = ref.watch(localAuthProvider).userId;
    final state = ref.watch(prepareTaskEditProvider(T2(userId, taskId)));
    return Scaffold(
      appBar: AppBar(
        title: Text(taskId.value),
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
    final userId = ref.watch(localAuthProvider).userId;
    final state = ref.watch(taskEditControllerFamily(T2(userId, task)));
    final controller =
        ref.read(taskEditControllerFamily(T2(userId, task)).notifier);
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
