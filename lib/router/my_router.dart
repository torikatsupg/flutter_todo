import 'package:flutter/material.dart';
import 'package:flutter_todo/page/error.dart';
import 'package:flutter_todo/page/home/home.dart';
import 'package:flutter_todo/page/home/todo/create.dart';
import 'package:flutter_todo/page/home/todo/edit.dart';
import 'package:flutter_todo/page/home/todo/id.dart';
import 'package:flutter_todo/page/notfound.dart';
import 'package:flutter_todo/page/home/mypage/setting.dart';
import 'package:flutter_todo/page/signin.dart';
import 'package:flutter_todo/page/signup.dart';
import 'package:flutter_todo/router/my_go_route.dart';
import 'package:go_router/go_router.dart';

class MyRouter extends StatelessWidget {
  MyRouter({Key? key}) : super(key: key);

  final _router = GoRouter(
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
        builder: (_, __) => const NotFound(),
      ),
      MyGoRoute(
        path: '/signin',
        builder: (_, __) => const Signin(),
      ),
      MyGoRoute(
        path: '/signup',
        builder: (_, __) => const Signup(),
      ),
      MyGoRoute(
        path: '/home/:tab',
        builder: (context, state) => Home(tab: state.params['tab']),
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
            builder: (context, state) => const Setting(),
          ),
          MyGoRoute(
            path: ':id',
            redirect: (state) =>
                state.params['tab'] == 'todo' ? null : '/notfound',
            builder: (context, state) => const Id(),
            routes: [
              MyGoRoute(
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
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
