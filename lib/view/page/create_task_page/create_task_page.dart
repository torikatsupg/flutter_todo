import 'package:flutter/material.dart';
import 'package:flutter_todo/view/component/my_form.dart';
import 'package:flutter_todo/view/page/create_task_page/create_task_page_controller.dart';
import 'package:flutter_todo/provider/local/local_provider.dart';
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
          MyTextField(
            model: state.name,
            decoration: const InputDecoration(
              hintText: 'task name',
              helperText: 'task name',
              label: Text('task name'),
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
