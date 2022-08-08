import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteGuard = String? Function(Reader read, GoRouterState state);

String _deafultHomePath(GoRouterState state) {
  return state.namedLocation(
    Routes.home.value,
    params: {
      ParamKeys.tab.value: HomeTab.task.value,
    },
  );
}

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
    return state.namedLocation(Routes.signIn.value);
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
    return _deafultHomePath(state);
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
    return state.namedLocation(Routes.register.value);
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
    return _deafultHomePath(state);
  } else {
    return null;
  }
}

String? todoTabGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotTaskTab = state.tab != HomeTab.task;
  if (isNotTaskTab) {
    return state.namedLocation(Routes.notFound.value);
  } else {
    return null;
  }
}

String? myPageTabGuard(
  Reader read,
  GoRouterState state,
) {
  final isNotMyPageTab = state.tab != HomeTab.mypage;
  if (isNotMyPageTab) {
    return state.namedLocation(Routes.notFound.value);
  } else {
    return null;
  }
}
