import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Id extends StatelessWidget {
  const Id({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('id'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('to edit'),
          onPressed: () => context.go('/home/todo/id/edit'),
        ),
      ),
    );
  }
}
