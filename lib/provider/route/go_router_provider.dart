import 'package:flutter/foundation.dart';
import 'package:flutter_todo/model/app_error.dart';
import 'package:flutter_todo/model/task.dart';
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

  String? get id => params['id'];
  String? get tab => params['tab'];
  String? get todo => queryParams['todo'];
}

final goRouterProvider = Provider(
  (ref) => GoRouter(
    routes: [
      MyGoRoute(
        path: '/',
        redirect: (_) => 'home/todo',
      ),
      MyGoRoute(
        path: '/home',
        redirect: (_) => '/home/todo',
      ),
      MyGoRoute(
        path: '/notfound',
        builder: (_, __) => const NotFoundPage(),
      ),
      MyGoRoute(
        path: '/signin',
        redirect: (_) => noAuthGuard(ref),
        builder: (_, __) => const SigninPage(),
      ),
      MyGoRoute(
        path: '/signup',
        redirect: (_) => noAuthGuard(ref),
        builder: (_, __) => const SignupPage(),
      ),
      MyGoRoute(
        path: '/home/:tab',
        redirect: (_) => authGuard(ref),
        builder: (context, state) => HomePage(state.getOrThrowTab),
        routes: [
          MyGoRoute(
            path: 'create',
            redirect: (state) => todoGuard(ref, state),
            builder: (context, state) => const CreatePage(),
          ),
          MyGoRoute(
            path: 'setting',
            redirect: (state) => myPageGuard(ref, state),
            builder: (context, state) => const SettingPage(),
          ),
          MyGoRoute(
            path: ':id',
            redirect: (state) => todoGuard(ref, state),
            builder: (context, state) => TaskDetailPage(
              state.getOrThrowTaskId,
            ),
            routes: [
              MyGoRoute(
                path: 'edit',
                redirect: (state) => todoGuard(ref, state),
                builder: (context, state) => EditTaskPage(
                  state.getOrThrowTaskId,
                ),
              ),
            ],
          ),
        ],
      ),
      if (kDebugMode)
        MyGoRoute(
          path: '/debug',
          builder: (_, __) => const DebugPage(),
        ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    initialLocation: '/signin',
  ),
);

extension GoRouterStateExt on GoRouterState {
  TaskId get getOrThrowTaskId {
    final maybeTaskId = params['id'];
    if (maybeTaskId != null) {
      return TaskId(maybeTaskId);
    } else {
      throw AppError.illigalUrl;
    }
  }

  String get getOrThrowTab {
    final maybeTab = params['tab'];
    if (maybeTab != null) {
      return maybeTab;
    } else {
      throw AppError.illigalUrl;
    }
  }
}
