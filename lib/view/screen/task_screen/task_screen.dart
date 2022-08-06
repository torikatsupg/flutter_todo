import 'package:flutter/material.dart';
import 'package:flutter_todo/config/page_storage_keys.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/view/page/task_tab/done_tab.dart';
import 'package:flutter_todo/view/page/task_tab/todo_tab.dart';
import 'package:flutter_todo/view/screen/task_screen/task_screen_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

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
      initialIndex: toIndex(ref.read(localTodoQueryParamProvier)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ref.listen<String>(
      localTodoQueryParamProvier,
      (prev, next) => _controller.index = toIndex(next),
    );
    final controller = ref.read(taskScreenControllerProvider);

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
        children: [
          TodoTab(key: PageStorageKies.todoTab.key),
          DoneTab(key: PageStorageKies.doneTab.key),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onTapFab,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
