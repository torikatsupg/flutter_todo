import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/page/error_page.dart';
import 'package:flutter_todo/page/home/home_page.dart';
import 'package:flutter_todo/page/home/task/create_task_page.dart';
import 'package:flutter_todo/page/home/task/edit_task_page.dart';
import 'package:flutter_todo/page/home/task/task_detail_page.dart';
import 'package:flutter_todo/page/notfound_page.dart';
import 'package:flutter_todo/page/home/mypage/setting_page.dart';
import 'package:flutter_todo/page/signin_page.dart';
import 'package:flutter_todo/page/signup_page.dart';

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
          builder: (_, __) => const NotFoundPage(),
        ),
        GoRoute(
          path: '/signin',
          builder: (_, __) => const SigninPage(),
        ),
        GoRoute(
          path: '/signup',
          builder: (_, __) => SignupPage(),
        ),
        GoRoute(
          path: '/home/:tab',
          builder: (context, state) => const HomePage(),
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
              builder: (context, state) => const SettingPage(),
              routes: [
                GoRoute(
                  path: 'test',
                  builder: (context, state) => SignupPage(),
                ),
              ],
            ),
            // GoRoute(
            //   path: ':id',
            //   redirect: (state) =>
            //       state.params['tab'] == 'todo' ? null : '/notfound',
            //   builder: (context, state) => const TaskDetailPage(),
            //   routes: [
            //     GoRoute(
            //       path: 'edit',
            //       builder: (context, state) => const EditTaskPage(),
            //     ),
            //   ],
            // ),
          ],
        ),
      ],
      errorBuilder: (context, state) => const ErrorPage(),
      urlPathStrategy: UrlPathStrategy.path,
      debugLogDiagnostics: true,
      initialLocation: '/signin'),
);
