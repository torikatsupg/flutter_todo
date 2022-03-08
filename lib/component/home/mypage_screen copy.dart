import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mypage'),
      ),
      body: Column(
        children: [
          TextButton(
            child: const Text('setting'),
            onPressed: () => context.go('/home/mypage/setting'),
          ),
        ],
      ),
    );
  }
}
