import 'package:flutter_todo/firebase/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteGuard = String? Function();

String? authGuard(ProviderRef<GoRouter> ref, [RouteGuard? guard]) {
  if (ref.read(authProvider) == null) {
    return '/signin';
  } else if (guard != null) {
    return guard();
  } else {
    return null;
  }
}

String? noAuthGuard(ProviderRef<GoRouter> ref, [RouteGuard? guard]) {
  if (ref.read(authProvider) != null) {
    return '/home/todo';
  } else if (guard != null) {
    return guard();
  } else {
    return null;
  }
}
