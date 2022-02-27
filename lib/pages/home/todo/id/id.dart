import 'package:flutter/material.dart';
import 'package:flutter_todo/component/navigate_buttons.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

MaterialPage createIdPage() {
  return const MaterialPage(
    child: _Id(),
  );
}

class _Id extends ConsumerWidget {
  const _Id({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('id is ${""}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: ref.read(routeProvider.notifier).pop,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: const [
            NavigateButtons(),
            Text('id'),
          ],
        ),
      ),
    );
  }
}
