import 'package:flutter/material.dart';
import 'package:flutter_todo/component/error_view.dart';
import 'package:flutter_todo/component/loading_view.dart';
import 'package:flutter_todo/provider/path_provider.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: toIndex(
        ref.read(goRouterStateProvider).queryParams['todo'],
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo'),
        bottom: TabBar(
          controller: _controller,
          onTap: (value) {
            context.go('/home/todo?todo=${fromIndex(value)}');
          },
          tabs: const [
            Tab(
              text: 'todo',
              icon: Icon(Icons.check_box_outline_blank),
            ),
            Tab(
              text: 'done',
              icon: Icon(Icons.check_box_outlined),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Consumer(
            builder: (_, ref, __) => ref.watch(todoTaskProvider).map(
                  data: (tasks) => ListView.builder(
                    itemCount: tasks.value.length,
                    itemBuilder: (context, index) {
                      final task = tasks.value[index];
                      return ListTile(
                        leading: Text(task.id),
                        title: Text(task.name),
                        onTap: () => context.go('/home/todo/${task.id}'),
                      );
                    },
                  ),
                  error: (_) => const ErrorView(),
                  loading: (_) => const LoadingView(),
                ),
          ),
          Consumer(
            builder: (_, ref, __) => ref.watch(todoTaskProvider).map(
                  data: (tasks) => ListView.builder(
                    itemCount: tasks.value.length,
                    itemBuilder: (context, index) {
                      final task = tasks.value[index];
                      return ListTile(
                        leading: Text(task.id),
                        title: Text(task.name),
                        onTap: () => context.go('/home/todo/${task.id}'),
                      );
                    },
                  ),
                  error: (_) => const ErrorView(),
                  loading: (_) => const LoadingView(),
                ),
          ),
        ],
      ),
    );
  }
}

String fromIndex(int index) {
  switch (index) {
    case 0:
      return 'todo';
    case 1:
      return 'done';
    default:
      throw UnimplementedError();
  }
}

int toIndex(String? query) {
  switch (query) {
    case 'todo':
      return 0;
    case 'done':
      return 1;
    default:
      return 0;
  }
}
