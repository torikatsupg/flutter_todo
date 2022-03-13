import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/path_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Id extends StatelessWidget {
  const Id({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('id'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, __) => TextButton(
            child: const Text('to edit'),
            onPressed: () => context.go(
              '/home/todo/${ref.read(goRouterStateProvider).params['id']}/edit',
            ),
          ),
        ),
      ),
    );
  }
}
