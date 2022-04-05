import 'package:flutter/material.dart';
import 'package:flutter_todo/component/loading_overlay.dart';
import 'package:flutter_todo/provider/input/loading_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            child!,
            if (ref.watch(loadingProvider)) const LoadingOverlay(),
          ],
        );
      },
      child: Consumer(
        builder: (_, ref, __) {
          final router = ref.watch(routerProvider);
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          );
        },
      ),
    );
  }
}
