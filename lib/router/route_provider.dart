import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/page/error.dart';
import 'package:flutter_todo/page/home/home.dart';
import 'package:flutter_todo/page/home/todo/create.dart';
import 'package:flutter_todo/page/home/todo/edit.dart';
import 'package:flutter_todo/page/home/todo/id.dart';
import 'package:flutter_todo/page/notfound.dart';
import 'package:flutter_todo/page/home/mypage/setting.dart';
import 'package:flutter_todo/page/signin.dart';
import 'package:flutter_todo/page/signup.dart';

typedef RouteProvider = StateNotifierProvider<RouteNotifier, Uri>;

final routeProvider = StateNotifierProvider<RouteNotifier, Uri>(
  (ref) => RouteNotifier(ref.watch(routerProvider)),
);

class RouteNotifier extends StateNotifier<Uri> {
  RouteNotifier(GoRouter router)
      : super(router.routerDelegate.currentConfiguration) {
    router.routerDelegate.addListener(
      () {
        print("change: ${router.routerDelegate.currentConfiguration}\n");
        state = router.routerDelegate.currentConfiguration;
      },
    );
  }
}

final routerProvider = Provider(
  (_) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (state) => '/home/todo',
      ),
      GoRoute(
        path: '/home',
        redirect: (_) => '/home/todo',
      ),
      GoRoute(
        path: '/notfound',
        builder: (_, __) => const NotFound(),
      ),
      GoRoute(
        path: '/signin',
        builder: (_, __) => const Signin(),
      ),
      GoRoute(
        path: '/signup',
        builder: (_, __) => const Signup(),
      ),
      GoRoute(
        path: '/home/:tab',
        builder: (context, state) => const Home(),
        routes: [
          GoRoute(
            path: 'create',
            redirect: (state) =>
                state.params['tab'] == 'todo' ? null : '/notfound',
            builder: (context, state) => const CreatePage(),
          ),
          GoRoute(
            path: 'setting',
            redirect: (state) =>
                state.params['tab'] == 'mypage' ? null : '/notfound',
            builder: (context, state) => const Setting(),
          ),
          GoRoute(
            path: ':id',
            redirect: (state) =>
                state.params['tab'] == 'todo' ? null : '/notfound',
            builder: (context, state) => const Id(),
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) => const Edit(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
  ),
);
