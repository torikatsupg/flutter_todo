import 'package:flutter/material.dart';
import 'package:flutter_todo/component/navigate_buttons.dart';

MaterialPage createSigninPage() {
  return const MaterialPage(
    child: _Signin(),
  );
}

class _Signin extends StatelessWidget {
  const _Signin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('signin'),
      ),
      body: Center(
        child: Column(
          children: const [
            NavigateButtons(),
            Text('signin'),
          ],
        ),
      ),
    );
  }
}
