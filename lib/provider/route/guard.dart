import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/util/util.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteGuard = String? Function();

String? authGuard(Reader read, [RouteGuard? guard]) {
  final isNotAuthenticated = read(authProvider).value == null;
  if (isNotAuthenticated) {
    return '/signin';
  } else if (guard != null) {
    return guard();
  } else if (guard != null) {
    return guard();
  } else {
    return null;
  }
}

String? noAuthGuard(Reader read, [RouteGuard? guard]) {
  final isAuthenticated = read(authProvider).value != null;
  if (isAuthenticated) {
    return '/home';
  } else {
    return null;
  }
}

String? userGuard(Reader read, [RouteGuard? guard]) {
  return authGuard(
    read,
    () {
      final isNotRegistered = read(userProvider).value == null;
      if (isNotRegistered) {
        return '/register';
      } else if (guard != null) {
        return guard();
      } else {
        return null;
      }
    },
  );
}

String? noUserGuard(Reader read) {
  final isRegistered = isNotNull(read(userProvider).value);
  return authGuard(
    read,
    () {
      if (isRegistered) {
        return '/home';
      } else {
        return null;
      }
    },
  );
}

String? todoGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotTodoTab = state.params['tab'] != 'todo';
  return userGuard(
    read,
    () {
      if (isNotTodoTab) {
        return '/notfound';
      } else {
        return null;
      }
    },
  );
}

String? myPageGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotMyPageTab = state.params['tab'] != 'mypage';
  return userGuard(
    read,
    () {
      if (isNotMyPageTab) {
        return '/notfound';
      } else {
        return null;
      }
    },
  );
}
