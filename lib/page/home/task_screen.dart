import 'package:flutter/material.dart';
import 'package:flutter_todo/component/error_view.dart';
import 'package:flutter_todo/component/loading_view.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:flutter_todo/provider/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TaskScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _controller;
  late final ScrollController _todoController;
  late final ScrollController _doneController;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: toIndex(ref.read(routeProvider).queryParams['tab']),
    );
    _todoController = ScrollController();
    _doneController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          ref.watch(todoTaskProvider).map(
                data: (tasks) => ListView.builder(
                  controller: _todoController,
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
          ref.watch(doneTaskProvider).map(
                data: (tasks) => ListView.builder(
                  controller: _doneController,
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
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
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
