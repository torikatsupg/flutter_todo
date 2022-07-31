import 'package:flutter/foundation.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/view/page/debug_page.dart';
import 'package:flutter_todo/view/page/edit_task_page.dart';
import 'package:flutter_todo/view/page/task_detail_page.dart';
import 'package:flutter_todo/provider/route/guard.dart';
import 'package:flutter_todo/provider/route/my_go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/view/page/error_page.dart';
import 'package:flutter_todo/view/page/home_page.dart';
import 'package:flutter_todo/view/page/create_task_page.dart';
import 'package:flutter_todo/view/page/notfound_page.dart';
import 'package:flutter_todo/view/page/setting_page.dart';
import 'package:flutter_todo/view/page/signin_page.dart';
import 'package:flutter_todo/view/page/signup_page.dart';

class RouteState {
  RouteState(this.params, this.queryParams, this.name);
  final Map<String, String> params;
  final Map<String, String> queryParams;
  final String? name;
}

final routerProvider = Provider(
  (ref) {
    final read = ref.read;
    return GoRouter(
      routes: [
        MyGoRoute(
          '/',
          read,
          redirect: (_) => 'home/todo',
        ),
        MyGoRoute(
          '/home',
          read,
          redirect: (_) => '/home/todo',
        ),
        MyGoRoute(
          '/notfound',
          read,
          builder: (_, __) => const NotFoundPage(),
        ),
        MyGoRoute(
          '/signin',
          read,
          redirect: (_) => noAuthGuard(read),
          builder: (_, __) => const SigninPage(),
        ),
        MyGoRoute(
          '/signup',
          read,
          redirect: (_) => noAuthGuard(read),
          builder: (_, __) => const SignupPage(),
        ),
        MyGoRoute(
          '/home/:tab',
          read,
          redirect: (_) => authGuard(read),
          builder: (context, state) => const HomePage(),
          routes: [
            MyGoRoute(
              'create',
              read,
              redirect: (state) => todoGuard(read, state),
              builder: (context, state) => const CreatePage(),
            ),
            MyGoRoute(
              'setting',
              read,
              redirect: (state) => myPageGuard(read, state),
              builder: (context, state) => const SettingPage(),
            ),
            MyGoRoute(
              ':id',
              read,
              redirect: (state) => todoGuard(read, state),
              builder: (context, state) => const TaskDetailPage(),
              routes: [
                MyGoRoute(
                  'edit',
                  read,
                  redirect: (state) => todoGuard(read, state),
                  builder: (context, state) => const EditTaskPage(),
                ),
              ],
            ),
          ],
        ),
        if (kDebugMode)
          MyGoRoute(
            '/debug',
            read,
            builder: (_, __) => const DebugPage(),
          ),
      ],
      errorBuilder: (context, state) => const ErrorPage(),
      urlPathStrategy: UrlPathStrategy.path,
      debugLogDiagnostics: true,
      initialLocation: '/signin',
      refreshListenable: authStateNotifier,
    );
  },
);

const _emptyQuery = <String, String>{};

extension GoRouterStateExt on GoRouterState {
  TaskId? get taskId {
    final maybeTaskId = params['id'];
    if (maybeTaskId != null) {
      return TaskId(maybeTaskId);
    } else {
      return null;
    }
  }

  String? get tab => params['tab'];

  String get todoQuery => queryParams['todo'] ?? "todo";
}

extension GoRouterExt on GoRouter {
  void go_(
    String path,
    Reader read, {
    Map<String, String> queryParameters = _emptyQuery,
    bool isMaintainQuery = true,
  }) {
    final nextQuery = isMaintainQuery
        ? (state(read).queryParams..addAll(queryParameters))
        : queryParameters;

    final queryStr = nextQuery
        .map((key, value) => MapEntry(key, '$key=$value'))
        .values
        .join('&');

    if (queryStr.isEmpty) {
      go(path);
    } else {
      go('$path?$queryStr');
    }
  }

  void pop_(Reader read) => read(routerProvider).routerDelegate.pop();

  RouteState state(Reader read) => _calcState(read(routerProvider));
}

RouteState _calcState(GoRouter router) {
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
    name,
  );
}
