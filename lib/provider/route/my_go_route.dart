import 'package:flutter/material.dart';
import 'package:flutter_todo/component/loading_overlay.dart';
import 'package:flutter_todo/page/dialog/network_alert_dialog.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteBuilder = Widget Function(
    BuildContext context, GoRouterState state);

class MyGoRoute extends GoRoute {
  MyGoRoute({
    required String path,
    RouteBuilder? builder,
    List<GoRoute>? routes,
    GoRouterRedirect? redirect,
  }) : super(
          redirect: redirect ?? (_) => null,
          path: path,
          builder: (context, state) {
            return Stack(
              children: [
                if (builder != null)
                  builder(context, state)
                else
                  _builder(context, state),
                Consumer(
                  builder: (context, ref, child) => ref.watch(loadingProvider)
                      ? child!
                      : const SizedBox.shrink(),
                  child: const LoadingOverlay(),
                ),
                const NetworkAlertDialog(),
              ],
            );
          },
          routes: routes ?? [],
        );
}

final RouteBuilder _builder = (context, state) => throw Error;
