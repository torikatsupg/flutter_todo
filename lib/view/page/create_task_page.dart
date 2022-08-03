import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/create_task_controller_provider.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePage extends ConsumerWidget {
  const CreatePage({super.key});

  @override
  Widget build(context, ref) {
    final userId = ref.watch(localUserProvider).userId;
    final state = ref.watch(createTaskControllerFamily(userId));
    final controller = ref.read(createTaskControllerFamily(userId).notifier);
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
