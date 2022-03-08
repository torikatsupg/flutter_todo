import 'package:flutter/material.dart';
import 'package:flutter_todo/component/home/mypage_screen%20copy.dart';
import 'package:flutter_todo/component/home/todo_screen.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({required this.navQuery, Key? key}) : super(key: key);

  final String? navQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: const [
          TodoScreen(),
          MyPageScreen(),
        ],
        index: toIndex(navQuery),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'todo'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'mypage'),
        ],
        currentIndex: toIndex(navQuery),
        onTap: (value) {
          GoRouter.of(context).go('/home/${toQuery(value)}');
        },
      ),
    );
  }

  int toIndex(String? query) {
    if (query == null) {
      return 0;
    } else if (query == 'todo') {
      return 0;
    } else if (query == 'mypage') {
      return 1;
    } else {
      return 0;
    }
  }

  String toQuery(int index) {
    if (index == 0) {
      return 'todo';
    } else if (index == 1) {
      return 'mypage';
    } else {
      return 'todo';
    }
  }
}
