import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteGuard = String? Function();

String? authGuard(Reader read, [RouteGuard? guard]) {
  if (read(authProvider).value == null) {
    return '/signin';
  } else if (guard != null) {
    return guard();
  } else {
    return null;
  }
}

String? noAuthGuard(Reader read, [RouteGuard? guard]) {
  if (read(authProvider).value != null) {
    return '/home';
  } else if (guard != null) {
    return guard();
  } else {
    return null;
  }
}

String? todoGuard(
  Reader read,
  GoRouterState state, [
  RouteGuard? guard,
]) {
  return authGuard(
    read,
    () {
      if (state.params['tab'] != 'todo') {
        return '/notfound';
      } else if (guard != null) {
        return guard();
      } else {
        return null;
      }
    },
  );
}

String? myPageGuard(
  Reader read,
  GoRouterState state, [
  RouteGuard? guard,
]) {
  return authGuard(
    read,
    () {
      if (state.params['tab'] != 'mypage') {
        return '/notfound';
      } else if (guard != null) {
        return guard();
      } else {
        return null;
      }
    },
  );
}
