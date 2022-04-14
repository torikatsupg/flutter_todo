import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/input/mypage_controller_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final controller = ref.read(myPageControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('mypage'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              TextButton(
                child: const Text('setting'),
                onPressed: () => context.go('/home/mypage/setting'),
              ),
              TextButton(
                child: const Text('signout'),
                onPressed: controller.signOut,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
