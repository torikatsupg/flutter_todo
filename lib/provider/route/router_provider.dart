import 'package:flutter/foundation.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:flutter_todo/view/page/debug_page/debug_page.dart';
import 'package:flutter_todo/view/page/edit_task_page/edit_task_page.dart';
import 'package:flutter_todo/view/page/register_page/register_page.dart';
import 'package:flutter_todo/view/page/task_detail_page/task_detail_page.dart';
import 'package:flutter_todo/provider/route/guard.dart';
import 'package:flutter_todo/provider/route/my_go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/view/page/error_page/error_page.dart';
import 'package:flutter_todo/view/page/home_page/home_page.dart';
import 'package:flutter_todo/view/page/create_task_page/create_task_page.dart';
import 'package:flutter_todo/view/page/notfound_page/notfound_page.dart';
import 'package:flutter_todo/view/page/setting_page/setting_page.dart';
import 'package:flutter_todo/view/page/signin_page/signin_page.dart';
import 'package:flutter_todo/view/page/signup_page/signup_page.dart';

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
          redirect: (state) => state.namedLocation(
            Routes.home.value,
            params: {
              ParamKeys.tab.value: HomeTab.task.value,
            },
          ),
        ),
        MyGoRoute(
          '/notfound',
          read,
          name: Routes.notFound,
          builder: (_, __) => const NotFoundPage(),
        ),
        MyGoRoute(
          '/signin',
          read,
          name: Routes.signIn,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              noAuthGuard,
            ],
          ),
          builder: (_, __) => const SigninPage(),
        ),
        MyGoRoute(
          '/signup',
          read,
          name: Routes.signUp,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              noAuthGuard,
            ],
          ),
          builder: (_, __) => const SignupPage(),
        ),
        MyGoRoute(
          '/register',
          read,
          name: Routes.register,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              authGuard,
              noUserGuard,
            ],
          ),
          builder: (_, __) => const RegisterPage(),
        ),
        MyGoRoute(
          '/home',
          read,
          redirect: (state) => state.namedLocation(
            Routes.home.value,
            params: {
              ParamKeys.tab.value: HomeTab.task.value,
            },
          ),
        ),
        MyGoRoute(
          '/home/:tab',
          read,
          name: Routes.home,
          redirect: (state) => combineGuard(
            state,
            read,
            [
              authGuard,
              userGuard,
            ],
          ),
          builder: (context, state) => const HomePage(),
          routes: [
            MyGoRoute(
              'create',
              read,
              name: Routes.taskCreate,
              redirect: (state) => combineGuard(
                state,
                read,
                [
                  authGuard,
                  userGuard,
                  todoTabGuard,
                ],
              ),
              builder: (context, state) => const CreatePage(),
            ),
            MyGoRoute(
              'setting',
              read,
              name: Routes.setting,
              redirect: (state) => combineGuard(
                state,
                read,
                [
                  authGuard,
                  userGuard,
                  myPageTabGuard,
                ],
              ),
              builder: (context, state) => const SettingPage(),
            ),
            MyGoRoute(
              ':id',
              read,
              name: Routes.taskDetail,
              redirect: (state) => combineGuard(
                state,
                read,
                [
                  authGuard,
                  userGuard,
                  todoTabGuard,
                ],
              ),
              builder: (context, state) => const TaskDetailPage(),
              routes: [
                MyGoRoute(
                  'edit',
                  read,
                  name: Routes.taskEdit,
                  redirect: (state) => combineGuard(
                    state,
                    read,
                    [
                      authGuard,
                      userGuard,
                      todoTabGuard,
                    ],
                  ),
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
            name: Routes.debug,
            builder: (_, __) => const DebugPage(),
          ),
      ],
      errorBuilder: (context, state) => const ErrorPage(),
      urlPathStrategy: UrlPathStrategy.path,
      debugLogDiagnostics: true,
      initialLocation: '/signin',
      refreshListenable: userStateNotifier,
    );
  },
);

extension GoRouterStateExt on GoRouterState {
  TaskId? get taskId {
    final maybeTaskId = params['id'];
    if (maybeTaskId != null) {
      return TaskId(maybeTaskId);
    } else {
      return null;
    }
  }

  HomeTab? get tab => HomeTab.parse(params['tab']);

  InnerTab get innerTab => InnerTab.parse(queryParams['innerTab']);
}

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
        ? (_calcState(this).queryParams..addAll(queryParamsMap))
        : queryParamsMap;

    goNamed(name.value, params: paramsMap, queryParams: nextQuery);
  }

  void pop_(Reader read) => read(routerProvider).routerDelegate.pop();
}

RouteState _calcState(GoRouter router) {
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
  return RouteState(
    params,
    queryParams,
    name,
  );
}
