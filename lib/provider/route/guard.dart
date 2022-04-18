import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteGuard = String? Function();

String? authGuard(ProviderRef<GoRouter> ref, [RouteGuard? guard]) {
  if (ref.read(authStreamProvider).value == null) {
    return '/signin';
  } else if (guard != null) {
    return guard();
  } else {
    return null;
  }
}

String? noAuthGuard(ProviderRef<GoRouter> ref, [RouteGuard? guard]) {
  if (ref.read(authStreamProvider).value != null) {
    return '/home';
  } else if (guard != null) {
    return guard();
  } else {
    return null;
  }
}

String? todoGuard(
  ProviderRef<GoRouter> ref,
  GoRouterState state, [
  RouteGuard? guard,
]) {
  return authGuard(
    ref,
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
  ProviderRef<GoRouter> ref,
  GoRouterState state, [
  RouteGuard? guard,
]) {
  return authGuard(
    ref,
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
