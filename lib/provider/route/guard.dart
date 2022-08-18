import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteGuard = String? Function(Ref ref, GoRouterState state);

String _deafultHomePath(GoRouterState state) {
  return state.namedLocation(
    Routes.home.value,
    params: {
      ParamKeys.tab.value: HomeTab.task.value,
    },
  );
}

String? combineGuard(GoRouterState state, Ref ref, List<RouteGuard> guards) {
  for (final guard in guards) {
    final redirectTo = guard(ref, state);
    if (redirectTo != null) {
      return redirectTo;
    }
  }
  return null;
}

String? authGuard(Ref ref, GoRouterState state) {
  final isNotAuthenticated = ref.read(authProvider).value == null;
  if (isNotAuthenticated) {
    return state.namedLocation(Routes.signIn.value);
  } else {
    return null;
  }
}

String? noAuthGuard(Ref ref, GoRouterState state) {
  final isAuthenticated = ref.read(authProvider).value != null;
  if (isAuthenticated) {
    return _deafultHomePath(state);
  } else {
    return null;
  }
}

String? userGuard(Ref ref, GoRouterState state) {
  final isNotRegistered = ref.read(userProvider).value == null;
  if (isNotRegistered) {
    return state.namedLocation(Routes.register.value);
  } else {
    return null;
  }
}

String? noUserGuard(Ref ref, GoRouterState state) {
  final isRegistered = ref.read(userProvider).value != null;
  if (isRegistered) {
    return _deafultHomePath(state);
  } else {
    return null;
  }
}

String? todoTabGuard(
  Ref ref,
  GoRouterState state,
) {
  final isNotTaskTab =
      HomeTab.parse(state.params[ParamKeys.tab.value]) != HomeTab.task;
  if (isNotTaskTab) {
    return state.namedLocation(Routes.notFound.value);
  } else {
    return null;
  }
}

String? myPageTabGuard(Ref ref, GoRouterState state) {
  final isNotMyPageTab =
      HomeTab.parse(state.params[ParamKeys.tab.value]) != HomeTab.mypage;
  if (isNotMyPageTab) {
    return state.namedLocation(Routes.notFound.value);
  } else {
    return null;
  }
}
