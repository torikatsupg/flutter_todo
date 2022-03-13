import 'package:flutter/material.dart';
import 'package:flutter_todo/component/error.dart';
import 'package:flutter_todo/component/home/home.dart';
import 'package:flutter_todo/component/home/todo/create.dart';
import 'package:flutter_todo/component/home/todo/edit.dart';
import 'package:flutter_todo/component/home/todo/id.dart';
import 'package:flutter_todo/component/notfound.dart';
import 'package:flutter_todo/component/home/mypage/setting.dart';
import 'package:flutter_todo/component/signin.dart';
import 'package:flutter_todo/component/signup.dart';
import 'package:go_router/go_router.dart';

class MyRouter extends StatelessWidget {
  MyRouter({Key? key}) : super(key: key);

  final _router = GoRouter(
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
        builder: (context, state) => Home(navQuery: state.params['tab']),
        routes: [
          GoRoute(
            path: 'create',
            redirect: (state) =>
                state.params['tab'] == 'todo' ? null : '/notfound',
            builder: (context, state) => const Create(),
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
    // errorBuilder: (context, state) => const ErrorPage(),
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
