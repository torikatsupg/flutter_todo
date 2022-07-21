import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/home_controller_provider.dart';
import 'package:flutter_todo/view/component/lazy_indexed_stack.dart';
import 'package:flutter_todo/view/screen/mypage_screen.dart';
import 'package:flutter_todo/view/screen/task_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage(this.tab, {Key? key}) : super(key: key);

  final String tab;

  @override
  Widget build(context, ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    return Scaffold(
      body: LazyIndexedStack(
        builders: [
          (context) => const TaskScreen(),
          (context) => const MyPageScreen(),
        ],
        index: controller.toIndex(tab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'todo'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'mypage'),
        ],
        currentIndex: controller.toIndex(tab),
        onTap: controller.onTapTab,
      ),
    );
  }
}
