import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/mypage_controller_provider.dart';
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
          TextButton(
            onPressed: controller.openSetting,
            child: const Text('setting'),
          ),
          TextButton(
            onPressed: controller.signOut,
            child: const Text('signout'),
          ),
        ],
      ),
    );
  }
}
