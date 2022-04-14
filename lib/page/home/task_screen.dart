import 'package:flutter/material.dart';
import 'package:flutter_todo/page/home/task/done_tab.dart';
import 'package:flutter_todo/page/home/task/todo_tab.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TaskScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: toIndex(ref.read(routerProvider).queryParams['tab']),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('task'),
        bottom: TabBar(
          controller: _controller,
          onTap: (value) {
            ref.read(routerProvider.notifier).go(
              '/home/todo',
              queryParameters: {
                'todo': fromIndex(value),
              },
            );
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
        children: const [
          TodoTab(),
          DoneTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            ref.read(routerProvider.notifier).go('/home/todo/create'),
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
