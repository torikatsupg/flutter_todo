import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('debug'),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                final uid = ref.read(authProvider).uid;
                final result = <Task>[];
                for (var i = 0; i < 100; i++) {
                  result.add(await ref
                      .read(taskRepositoryFamily(uid))
                      .insert(name: '$i'));
                }
              },
              title: const Text('create many todo'),
            ),
            ListTile(
              onTap: () async {
                final uid = ref.read(authProvider).uid;
                final result = [];
                for (var i = 0; i < 100; i++) {
                  result.add(await ref
                      .read(taskRepositoryFamily(uid))
                      .insert(name: '$i'));
                }
                await Future.wait(result.map(
                  (e) => ref
                      .read(taskRepositoryFamily(uid))
                      .update(e.copyWith(isDone: true)),
                ));
              },
              title: const Text('create many done'),
            ),
          ],
        ),
      ),
    );
  }
}
