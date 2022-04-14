import 'package:flutter_todo/provider/route/my_go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/page/error_page.dart';
import 'package:flutter_todo/page/home/home_page.dart';
import 'package:flutter_todo/page/home/task/create_task_page.dart';
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
        MyGoRoute(
          path: '/',
          redirect: (state) => '/home/todo',
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
          builder: (_, __) => const SigninPage(),
        ),
        MyGoRoute(
          path: '/signup',
          builder: (_, __) => SignupPage(),
        ),
        MyGoRoute(
          path: '/home/:tab',
          builder: (context, state) => const HomePage(),
          routes: [
            MyGoRoute(
              path: 'create',
              redirect: (state) =>
                  state.params['tab'] == 'todo' ? null : '/notfound',
              builder: (context, state) => const CreatePage(),
            ),
            MyGoRoute(
              path: 'setting',
              redirect: (state) =>
                  state.params['tab'] == 'mypage' ? null : '/notfound',
              builder: (context, state) => const SettingPage(),
              routes: [
                MyGoRoute(
                  path: 'test',
                  builder: (context, state) => SignupPage(),
                ),
              ],
            ),
            // MyGoRoute(
            //   path: ':id',
            //   redirect: (state) =>
            //       state.params['tab'] == 'todo' ? null : '/notfound',
            //   builder: (context, state) => const TaskDetailPage(),
            //   routes: [
            //     MyGoRoute(
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
