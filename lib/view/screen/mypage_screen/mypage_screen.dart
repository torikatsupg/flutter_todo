import 'package:flutter/material.dart';
import 'package:flutter_todo/view/screen/mypage_screen/mypage_screen_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

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
            onPressed: () => showLicensePage(context: context),
            child: const Text('license'),
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
