import 'package:flutter/material.dart';
import 'package:flutter_todo/view/component/loading_overlay.dart';
import 'package:flutter_todo/view/dialog/network_alert_dialog.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteBuilder = Widget Function(
    BuildContext context, GoRouterState state);

class MyGoRoute extends GoRoute {
  MyGoRoute({
    required super.path,
    RouteBuilder? builder,
    super.routes = const [],
    GoRouterRedirect? redirect,
  }) : super(
          redirect: redirect ?? (_) => null,
          builder: (context, state) {
            assert(builder != null);
            return Stack(
              children: [
                builder!(context, state),
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
        );
}
