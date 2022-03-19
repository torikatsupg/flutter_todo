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

typedef RouteProvider = StateNotifierProvider<RouteNotifier, RouteState>;

final routeProvider = StateNotifierProvider<RouteNotifier, RouteState>(
    (ref) => RouteNotifier(ref.watch(routerProvider)));

class RouteNotifier extends StateNotifier<RouteState> {
  RouteNotifier(GoRouter router) : super(calcState(router)) {
    router.routerDelegate.addListener(() => state = calcState(router));
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

RouteState calcState(GoRouter router) {
  // ignore: invalid_use_of_visible_for_testing_member
  final matches = router.routerDelegate.matches;
  assert(matches.isNotEmpty);
  var params = <String, String>{};
  var queryParams = <String, String>{};
  String? name;
  for (final match in matches) {
    params.addAll(match.decodedParams);
    queryParams.addAll(match.queryParams);
    name = match.route.name;
  }
  return RouteState(
    params,
    queryParams,
    name, // nameがnullはあり得ない
    router.routerDelegate.currentConfiguration,
  );
}

class RouteState {
  RouteState(this.params, this.queryParams, this.name, this.uri);
  final Map<String, String> params;
  final Map<String, String> queryParams;
  final String? name;
  final Uri uri;

  String? get id => params['id'];
  String? get tab => params['tab'];
  String? get todo => queryParams['todo'];
}
