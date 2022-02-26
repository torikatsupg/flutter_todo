import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home/mypage/my_page.dart';
import 'package:flutter_todo/pages/home/todo/todo.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

MaterialPage createHomePage() {
  return const MaterialPage(
    child: _Home(),
  );
}

class _Home extends ConsumerStatefulWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __HomeState();
}

class __HomeState extends ConsumerState<_Home> {
  @override
  Widget build(BuildContext context) {
    final homePath = ref.watch(routeProvider);
    if (homePath is HomePath) {
      return ProviderScope(
        overrides: [
          homeRouteProvider.overrideWithValue(homePath),
        ],
        child: Consumer(builder: (context, ref, child) {
          return Scaffold(
            body: IndexedStack(
              index: ref.read(homeRouteProvider).index,
              children: const [
                TodoScreen(),
                MyPageScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: ref.read(routeProvider.notifier).setIndex,
              currentIndex: ref.read(homeRouteProvider).index,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit),
                  label: 'todo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit),
                  label: 'mypage',
                ),
              ],
            ),
          );
        }),
      );
    } else {
      return const Center();
    }
  }
}
