import 'package:flutter/material.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigateButtons extends ConsumerWidget {
  const NavigateButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => ref.read(routeProvider.notifier).set(TodoTabPath()),
          child: const Text('todo'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(routeProvider.notifier).set(DoneTabPath()),
          child: const Text('done'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(routeProvider.notifier).set(MyPagePath()),
          child: const Text('mypage'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(routeProvider.notifier).set(SigninPath()),
          child: const Text('signin'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(routeProvider.notifier).set(SignupPath()),
          child: const Text('signup'),
        ),
      ],
    );
  }
}
