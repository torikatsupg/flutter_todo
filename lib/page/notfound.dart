import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('not found'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.go('/home'),
          child: const Text('back to home'),
        ),
      ),
    );
  }
}
