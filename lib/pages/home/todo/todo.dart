import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home/todo/done_tab.dart';
import 'package:flutter_todo/pages/home/todo/todo_tab.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    ref.read(routeProvider.notifier).addListener((state) {
      if (state is TodoPath) {
        _tabController.index = state.tabIndex;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo screen'),
        bottom: TabBar(
          controller: _tabController,
          onTap: ref.read(routeProvider.notifier).setTabIndex,
          tabs: const [
            Tab(
              text: 'TODO',
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              text: 'DONE',
              icon: Icon(Icons.directions_bike),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TodoTab(),
          DoneTab(),
        ],
      ),
    );
  }
}
