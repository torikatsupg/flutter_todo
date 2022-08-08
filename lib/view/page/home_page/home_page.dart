import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/view/component/lazy_indexed_stack.dart';
import 'package:flutter_todo/view/page/home_page/home_page_controller.dart';
import 'package:flutter_todo/view/screen/mypage_screen/mypage_screen.dart';
import 'package:flutter_todo/view/screen/task_screen/task_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(context, ref) {
    final tab = ref.watch(localTabParamProvier);
    final controller = ref.read(homeControllerProvider.notifier);
    return Scaffold(
      body: LazyIndexedStack(
        builders: [
          (context) => const TaskScreen(),
          (context) => const MyPageScreen(),
        ],
        index: tab.index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'task'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'mypage'),
        ],
        currentIndex: tab.index,
        onTap: controller.onTapTab,
      ),
    );
  }
}
