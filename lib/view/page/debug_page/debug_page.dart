import 'package:flutter/material.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/local/local_provider.dart';
import 'package:flutter_todo/provider/model/task_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

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
                final userId = ref.read(localUserProvider).userId;
                final result = <Result<Task, dynamic>>[];
                for (var i = 0; i < 100; i++) {
                  result.add(await ref
                      .read(taskRepositoryFamily(userId))
                      .insert(name: '$i'));
                }
              },
              title: const Text('create many todo'),
            ),
            ListTile(
              onTap: () async {
                final userId = ref.read(localUserProvider).userId;
                final result = [];
                for (var i = 0; i < 100; i++) {
                  result.add(await ref
                      .read(taskRepositoryFamily(userId))
                      .insert(name: '$i'));
                }
                await Future.wait(result.map(
                  (e) => ref
                      .read(taskRepositoryFamily(userId))
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
