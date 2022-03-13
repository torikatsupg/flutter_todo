import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('signup'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => context.go('/signin'),
            child: const Text('to signin'),
          ),
        ],
      ),
    );
  }
}
