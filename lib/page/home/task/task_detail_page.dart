import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final id = ref.watch(idProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Center(
        child: TextButton(
          child: const Text('to edit'),
          onPressed: () =>
              ref.read(routerProvider).routerDelegate.go('/home/todo/$id/edit'),
        ),
      ),
    );
  }
}
