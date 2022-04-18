import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/create_task_controller_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePage extends ConsumerWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(createTaskController);
    final controller = ref.read(createTaskController.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('create'),
      ),
      body: Column(
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
      ),
    );
  }
}
