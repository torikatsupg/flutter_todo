import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/route/local_provider_scope.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/view/component/loading_overlay.dart';
import 'package:flutter_todo/view/dialog/network_alert_dialog.dart';
import 'package:flutter_todo/view/page/debug_page/debug_page.dart';
import 'package:flutter_todo/view/page/edit_task_page/edit_task_page.dart';
import 'package:flutter_todo/view/page/register_page/register_page.dart';
import 'package:flutter_todo/view/page/task_detail_page/task_detail_page.dart';
import 'package:flutter_todo/provider/route/guard.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/view/page/error_page/error_page.dart';
import 'package:flutter_todo/view/page/home_page/home_page.dart';
import 'package:flutter_todo/view/page/create_task_page/create_task_page.dart';
import 'package:flutter_todo/view/page/notfound_page/notfound_page.dart';
import 'package:flutter_todo/view/page/setting_page/setting_page.dart';
import 'package:flutter_todo/view/page/signin_page/signin_page.dart';
import 'package:flutter_todo/view/page/signup_page/signup_page.dart';

final routerProvider = Provider(
  (ref) {
    final read = ref.read;
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          redirect: (state) => state.namedLocation(
            Routes.home.value,
            params: {
              ParamKeys.tab.value: HomeTab.task.value,
            },
          ),
        ),
        GoRoute(
          path: '/notfound',
          name: Routes.notFound.value,
          builder: _builder(const NotFoundPage()),
        ),
        GoRoute(
          path: '/signin',
          name: Routes.signIn.value,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              noAuthGuard,
            ],
          ),
          builder: _builder(const SigninPage()),
        ),
        GoRoute(
          path: '/signup',
          name: Routes.signUp.value,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              noAuthGuard,
            ],
          ),
          builder: _builder(const SignupPage()),
        ),
        GoRoute(
          path: '/register',
          name: Routes.register.value,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              authGuard,
              noUserGuard,
            ],
          ),
          builder: _builder(const RegisterPage()),
        ),
        GoRoute(
          path: '/home',
          redirect: (state) => state.namedLocation(
            Routes.home.value,
            params: {
              ParamKeys.tab.value: HomeTab.task.value,
            },
          ),
        ),
        GoRoute(
          path: '/home/:tab',
          name: Routes.home.value,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              authGuard,
              userGuard,
            ],
          ),
          builder: _builder(const HomePage()),
          routes: [
            GoRoute(
              path: 'create',
              name: Routes.taskCreate.value,
              redirect: (state) => combineGuard(
                state,
                read,
                [
                  authGuard,
                  userGuard,
                  todoTabGuard,
                ],
              ),
              builder: _builder(const CreatePage()),
            ),
            GoRoute(
              path: 'setting',
              name: Routes.setting.value,
              redirect: (state) => combineGuard(
                state,
                read,
                [
                  authGuard,
                  userGuard,
                  myPageTabGuard,
                ],
              ),
              builder: _builder(const SettingPage()),
            ),
            GoRoute(
              path: ':taskId',
              name: Routes.taskDetail.value,
              redirect: (state) => combineGuard(
                state,
                read,
                [
                  authGuard,
                  userGuard,
                  todoTabGuard,
                ],
              ),
              builder: _builder(const TaskDetailPage()),
              routes: [
                GoRoute(
                  path: 'edit',
                  name: Routes.taskEdit.value,
                  redirect: (state) => combineGuard(
                    state,
                    read,
                    [
                      authGuard,
                      userGuard,
                      todoTabGuard,
                    ],
                  ),
                  builder: _builder(const EditTaskPage()),
                ),
              ],
            ),
          ],
        ),
        if (kDebugMode)
          GoRoute(
            path: '/debug',
            name: Routes.debug.value,
            builder: _builder(const DebugPage()),
          ),
      ],
      errorBuilder: _builder(const ErrorPage()),
      urlPathStrategy: UrlPathStrategy.path,
      debugLogDiagnostics: true,
      initialLocation: '/signin',
      refreshListenable: userStateNotifier,
      navigatorBuilder: navigatorBuilder,
    );
  },
);

extension GoRouterExt on GoRouter {
  void goNamed_(
    Routes name, {
    Map<ParamKeys, String> params = const {},
    Map<QueryParamKeys, String> queryParams = const {},
    bool isMaintainQuery = true,
  }) {
    final paramsMap = params.map((key, value) => MapEntry(key.value, value));
    final queryParamsMap =
        queryParams.map((key, value) => MapEntry(key.value, value));

    final nextQuery = isMaintainQuery
        ? (_RouteState._fromRouter(this).queryParams..addAll(queryParamsMap))
        : queryParamsMap;

    goNamed(name.value, params: paramsMap, queryParams: nextQuery);
  }

  void pop_(Reader read) => read(routerProvider).routerDelegate.pop();
}

class _RouteState {
  _RouteState(this.params, this.queryParams, this.name);
  final Map<String, String> params;
  final Map<String, String> queryParams;
  final String? name;

  factory _RouteState._fromRouter(GoRouter router) {
    // ignore: invalid_use_of_visible_for_testing_member
    final matches = router.routerDelegate.matches.matches;
    assert(matches.isNotEmpty);
    var params = <String, String>{};
    var queryParams = <String, String>{};
    String? name;
    for (final match in matches) {
      params.addAll(match.decodedParams);
      queryParams.addAll(match.queryParams);
      name = match.route.name;
    }
    return _RouteState(
      params,
      queryParams,
      name,
    );
  }
}


Widget Function(BuildContext, GoRouterState) _builder(Widget child) {
  return (BuildContext context, GoRouterState state) {
    return LocalProviderScope(
      state: state,
      child: child,
    );
  };
}

Widget navigatorBuilder(_, __, Widget child) {
  return Stack(
    children: [
      child,
      const LoadingOverlay(),
      const NetworkAlertDialog(),
    ],
  );
}
