import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return FutureBuilder<bool>(
      future: _init(ref),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
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

/// initializing between [runApp] and [MaterialApp.router]
Future<bool> _init(WidgetRef ref) async {
  await Future.wait([
    // [FirebaseAuth.instance.authStateChange] sends User to the Stream
    // at initialization if authenticated, or null if not authenticated.
    // To avoid having the sign-in screen appear momentarily despite
    // the fact that the user has authenticated when the app is launched,
    // the GoRouter is attached after waiting for the first event.
    ref.read(userProvider.stream).first,
  ]);
  return true;
}
