import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/route/go_router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return FutureBuilder<bool>(
      future: _init(ref),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          );
        } else {
          // TODO(torikatsu): show splash screen
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// initializing between runApp() and MaterialApp.router()
Future<bool> _init(WidgetRef ref) async {
  await FirebaseAuth.instance.authStateChanges().first;
  return true;
}
