import 'package:flutter/material.dart';
import 'package:flutter_todo/component/lazy_indexed_stack.dart';
import 'package:flutter_todo/page/home/mypage_screen.dart';
import 'package:flutter_todo/page/home/task_screen.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final tab = ref.watch(tabProvider);
    return Scaffold(
      body: LazyIndexedStack(
        builders: [
          (context) => const TaskScreen(),
          (context) => const MyPageScreen(),
        ],
        index: TabIndex.toIndex(tab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'todo'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'mypage'),
        ],
        currentIndex: TabIndex.toIndex(tab),
        onTap: (value) =>
            ref.read(routerProvider).go('/home/${TabIndex.toParam(value)}'),
      ),
    );
  }
}

class TabIndex {
  static const _map = {'todo': 0, 'mypage': 1};

  static int toIndex(String tab) => _map[tab]!;

  // param -> indexはparamが不明だが、idnex -> paramはparamが必ずわかる
  static String toParam(int index) {
    return _map.keys.firstWhere((e) => _map[e] == index);
  }
}
