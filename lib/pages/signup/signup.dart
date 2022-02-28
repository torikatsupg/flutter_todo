import 'package:flutter/material.dart';
import 'package:flutter_todo/component/navigate_buttons.dart';

MaterialPage createSignupPage() {
  return const MaterialPage(
    child: _Signup(),
  );
}

class _Signup extends StatelessWidget {
  const _Signup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('signup'),
      ),
      body: Center(
        child: Column(
          children: const [
            NavigateButtons(),
            Text('signup'),
          ],
        ),
      ),
    );
  }
}
