import 'package:flutter/material.dart';
import 'package:flutter_todo/router/my_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => const MyRouter();
}
