import 'package:flutter/material.dart';
import 'package:flutter_todo/component/error_view.dart';
import 'package:flutter_todo/component/loading_view.dart';
import 'package:flutter_todo/component/not_found_view.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/controller/task_edit_controller_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditTaskPage extends ConsumerWidget {
  const EditTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(idProvider)),
      ),
      body: ref.watch(taskProvider).map(
            data: (data) {
              final task = data.value;
              return task != null
                  ? ProviderScope(
                      overrides: [
                        taskEditControllerProvider.overrideWithProvider(
                          taskEditControllerFamily(task),
                        ),
                      ],
                      child: const _EditView(),
                    )
                  : const NotFoundView();
            },
            error: (e) => const ErrorView(),
            loading: (_) => const LoadingView(),
          ),
    );
  }
}

class _EditView extends ConsumerWidget {
  const _EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskEditControllerProvider);
    final controller = ref.read(taskEditControllerProvider.notifier);
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
