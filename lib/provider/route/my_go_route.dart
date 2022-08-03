import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/view/component/loading_overlay.dart';
import 'package:flutter_todo/view/dialog/network_alert_dialog.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteBuilder = Widget Function(
    BuildContext context, GoRouterState state);

class MyGoRoute extends GoRoute {
  MyGoRoute(
    String path,
    Reader read, {
    RouteBuilder? builder,
    super.routes = const [],
    GoRouterRedirect? redirect,
  }) : super(
          path: path,
          redirect: redirect ?? (_) => null,
          builder: (context, state) {
            assert(builder != null);
            final maybeAuth = read(authProvider).value;
            final maybeUser = read(userProvider).value;
            final maybeTab = state.tab;
            final maybeTaskId = state.taskId;
            return ProviderScope(
              overrides: [
                if (maybeAuth != null)
                  localAuthProvider.overrideWithValue(maybeAuth),
                if (maybeUser != null)
                  localUserProvider.overrideWithValue(maybeUser),
                if (maybeTab != null)
                  localTabParamProvier.overrideWithValue(maybeTab),
                if (maybeTaskId != null)
                  localTaskIdParamProvier.overrideWithValue(maybeTaskId),
                localTodoQueryParamProvier.overrideWithValue(state.todoQuery),
              ],
              child: Stack(
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
              ),
            );
          },
        );
}
