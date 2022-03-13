import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo'),
      ),
      body: Column(
        children: [
          TextButton(
            child: const Text('to detail'),
            onPressed: () => context.go('/home/todo/some_id'),
          ),
          TextButton(
            child: const Text('to create'),
            onPressed: () => context.go('/home/todo/create'),
          )
        ],
      ),
    );
  }
}
