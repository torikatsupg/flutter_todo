import 'package:flutter_todo/provider/base/cached_provider.dart';
import 'package:flutter_todo/provider/router_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteProvider = StateNotifierProvider<RouteNotifier, RouteState>;

final routeProvider = StateNotifierProvider<RouteNotifier, RouteState>(
    (ref) => RouteNotifier(ref.watch(routerProvider)));

class RouteNotifier extends StateNotifier<RouteState> {
  RouteNotifier(GoRouter router) : super(calcState(router)) {
    router.routerDelegate.addListener(() => state = calcState(router));
  }
}

final tabProvider = cachedProvider<String, RouteState>(
  initializer: (ref) => ref.read(routeProvider).tab!,
  provider: routeProvider,
  shouldUpdate: (next) => next.tab != null,
  toState: (next) => next.tab!,
);

final idProvider = cachedProvider<String, RouteState>(
  initializer: (ref) => ref.read(routeProvider).id!,
  provider: routeProvider,
  shouldUpdate: (next) => next.id != null,
  toState: (next) => next.id!,
);

final todoProvider = cachedProvider<String?, RouteState>(
  initializer: (ref) => ref.read(routeProvider).todo,
  provider: routeProvider,
  shouldUpdate: (next) => next.todo != null,
  toState: (next) => next.todo,
);


RouteState calcState(GoRouter router) {
  // ignore: invalid_use_of_visible_for_testing_member
  final matches = router.routerDelegate.matches;
  assert(matches.isNotEmpty);
  var params = <String, String>{};
  var queryParams = <String, String>{};
  String? name;
  for (final match in matches) {
    params.addAll(match.decodedParams);
    queryParams.addAll(match.queryParams);
    name = match.route.name;
  }
  return RouteState(
    params,
    queryParams,
    name,
    router.routerDelegate.currentConfiguration,
  );
}
