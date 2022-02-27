import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home/home.dart';
import 'package:flutter_todo/pages/home/todo/id/id.dart';
import 'package:flutter_todo/pages/signin/signin.dart';
import 'package:flutter_todo/pages/signup/signup.dart';
import 'package:flutter_todo/pages/unknown/unknown.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyNavigator extends ConsumerWidget {
  const MyNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(routeProvider);
    return Navigator(
      pages: [
        if (route is SigninPath)
          createSigninPage()
        else if (route is SignupPath)
          createSignupPage()
        else if (route is HomePath) ...[
          createHomePage(),
          if (route is IdPath) createIdPage(),
        ] else if (route is UnknownPath)
          createUnknownPage(),
      ],
      onPopPage: (route, result) => ref.read(routeProvider.notifier).pop(),
    );
  }
}
