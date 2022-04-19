import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/home_controller_provider.dart';
import 'package:flutter_todo/view/component/lazy_indexed_stack.dart';
import 'package:flutter_todo/view/page/mypage_screen.dart';
import 'package:flutter_todo/view/page/task_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    return Scaffold(
      body: LazyIndexedStack(
        builders: [
          (context) => const TaskScreen(),
          (context) => const MyPageScreen(),
        ],
        index: state,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'todo'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'mypage'),
        ],
        currentIndex: state,
        onTap: controller.onTapTab,
      ),
    );
  }
}
