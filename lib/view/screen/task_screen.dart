import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/task_controller_provider.dart';
import 'package:flutter_todo/view/page/task_tab/done_tab.dart';
import 'package:flutter_todo/view/page/task_tab/todo_tab.dart';
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
        length: 2, vsync: this, initialIndex: ref.read(taskControllerProvider));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = ref.read(taskControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('task'),
        bottom: TabBar(
          controller: _controller,
          onTap: controller.onTap,
          tabs: const [
            Tab(text: 'todo', icon: Icon(Icons.check_box_outline_blank)),
            Tab(text: 'done', icon: Icon(Icons.check_box_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [TodoTab(), DoneTab()],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.onTapFab,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
