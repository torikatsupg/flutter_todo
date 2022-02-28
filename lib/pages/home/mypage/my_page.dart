import 'package:flutter/material.dart';
import 'package:flutter_todo/component/navigate_buttons.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mypage'),
      ),
    );
  }
}
