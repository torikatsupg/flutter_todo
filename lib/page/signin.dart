import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('signin'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => context.go('/signup'),
            child: const Text('to signup'),
          ),
          TextButton(
            onPressed: () => context.go('/home'),
            child: const Text('home'),
          ),
        ],
      ),
    );
  }
}
