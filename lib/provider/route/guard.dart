import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteGuard = String? Function(Reader read, GoRouterState state);

String? combineGuard(
  GoRouterState state,
  Reader read,
  List<RouteGuard> guards,
) {
  for (final guard in guards) {
    final redirectTo = guard(read, state);
    if (redirectTo != null) {
      return redirectTo;
    }
  }
  return null;
}

String? authGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotAuthenticated = read(authProvider).value == null;
  if (isNotAuthenticated) {
    return '/signin';
  } else {
    return null;
  }
}

String? noAuthGuard(
  Reader read,
  GoRouterState state,
) {
  final isAuthenticated = read(authProvider).value != null;
  if (isAuthenticated) {
    return '/home';
  } else {
    return null;
  }
}

String? userGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotRegistered = read(userProvider).value == null;
  if (isNotRegistered) {
    return '/register';
  } else {
    return null;
  }
}

String? noUserGuard(
  Reader read,
  GoRouterState state,
) {
  final isRegistered = read(userProvider).value != null;
  if (isRegistered) {
    return '/home';
  } else {
    return null;
  }
}

String? todoGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotTodoTab = state.params['tab'] != 'todo';
  if (isNotTodoTab) {
    return '/notfound';
  } else {
    return null;
  }
}

String? myPageGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotMyPageTab = state.params['tab'] != 'mypage';
  if (isNotMyPageTab) {
    return '/notfound';
  } else {
    return null;
  }
}
