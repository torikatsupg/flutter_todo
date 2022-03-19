import 'package:flutter/material.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Id extends ConsumerWidget {
  const Id({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final id = ref.read(routeProvider).path;
    return Scaffold(
      appBar: AppBar(
        title: const Text('id'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, __) => TextButton(
            child: const Text('to edit'),
            onPressed: () => ref
                .read(routerProvider)
                .routerDelegate
                .go('/home/todo/some_id/edit'),
          ),
        ),
      ),
    );
  }
}
