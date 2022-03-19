import 'package:flutter/material.dart';
import 'package:flutter_todo/page/home/mypage_screen%20copy.dart';
import 'package:flutter_todo/page/home/todo_screen.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (_, ref, __) => Text(
            ref.watch(routeProvider).toString(),
          ),
        ),
      ),
      body: IndexedStack(
        children: const [
          TodoScreen(),
          MyPageScreen(),
        ],
        index: TabIndex.toIndex(ref.watch(routeProvider)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'todo'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'mypage'),
        ],
        currentIndex: TabIndex.toIndex(ref.watch(routeProvider)),
        onTap: (value) =>
            ref.read(routerProvider).go('/home/${TabIndex.toParam(value)}'),
      ),
    );
  }
}

class TabIndex {
  static const _map = {'todo': 0, 'mypage': 1};
  static const _default = 'todo';

  static int toIndex(Uri uri) {
    if (uri.pathSegments.contains('todo')) {
      return 0;
    } else if (uri.pathSegments.contains('mypage')) {
      return 1;
    } else {
      // TODO(torikatsu): 多分ここにこない
      throw Exception('${uri.toString()} is not correct');
    }
  }

  // param -> indexはparamが不明だが、idnex -> paramはparamが必ずわかる
  static String toParam(int index) {
    return _map.keys.firstWhere((e) => _map[e] == index);
  }
}
