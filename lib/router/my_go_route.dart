import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/path_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef GoRouterBuilderWithNav = Widget Function(
  BuildContext context,
  GoRouterState state,
  Navigator navigator,
);

typedef GoRouterPageBuilder = Page<void> Function(
  BuildContext context,
  GoRouterState state,
);

typedef GoRouterWidgetBuilder = Widget Function(
  BuildContext context,
  GoRouterState state,
);

typedef GoRouterRedirect = String? Function(GoRouterState state);

typedef GoRouterNavigatorBuilder = Widget Function(
  BuildContext context,
  GoRouterState state,
  Widget child,
);

class MyGoRoute extends GoRoute {
  MyGoRoute({
    required String path,
    String? name,
    GoRouterPageBuilder? pageBuilder,
    GoRouterWidgetBuilder builder = _builder,
    List<GoRoute> routes = const [],
    GoRouterRedirect redirect = _redirect,
  }) : super(
          path: path,
          name: name,
          pageBuilder: pageBuilder,
          builder: (_, state) => ProviderScope(
            overrides: [goRouterStateProvider.overrideWithValue(state)],
            child: Builder(
              builder: (context) => builder(context, state),
            ),
          ),
          routes: routes,
          redirect: redirect,
        );

  static Widget _builder(BuildContext context, GoRouterState state) =>
      throw Exception(
        'GoRoute builder parameter not set\n'
        'See gorouter.dev/redirection#considerations for details',
      );

  static String? _redirect(GoRouterState state) => null;
}
