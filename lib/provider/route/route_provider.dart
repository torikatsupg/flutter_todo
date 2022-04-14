import 'package:flutter_todo/provider/base/cached_provider.dart';
import 'package:flutter_todo/provider/route/go_router_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteProvider = StateNotifierProvider<RouteNotifier, RouteState>;

final routerProvider = StateNotifierProvider<RouteNotifier, RouteState>(
    (ref) => RouteNotifier(ref.watch(goRouterProvider), ref.read));

const _emptyQuery = <String, String>{};

class RouteNotifier extends StateNotifier<RouteState> {
  RouteNotifier(GoRouter router, this._read) : super(calcState(router)) {
    router.routerDelegate.addListener(() => state = calcState(router));
  }

  final Reader _read;

  void go(
    String path, {
    Map<String, String> queryParameters = _emptyQuery,
    bool isMaintainQuery = true,
  }) {
    final nextQuery = isMaintainQuery
        ? (state.queryParams..addAll(queryParameters))
        : queryParameters;

    final queryStr = nextQuery
        .map((key, value) => MapEntry(key, '$key=$value'))
        .values
        .join('&');

    if (queryStr.isEmpty) {
      _read(goRouterProvider).go(path);
    } else {
      _read(goRouterProvider).go('$path?$queryStr');
    }
  }

  void pop() => _read(goRouterProvider).routerDelegate.pop();
}

final tabProvider = cachedProvider<String, RouteState>(
  initializer: (ref) => ref.read(routerProvider).tab!,
  provider: routerProvider,
  shouldUpdate: (next) => next.tab != null,
  toState: (next) => next.tab!,
);

final idProvider = cachedProvider<String, RouteState>(
  initializer: (ref) => ref.read(routerProvider).id!,
  provider: routerProvider,
  shouldUpdate: (next) => next.id != null,
  toState: (next) => next.id!,
);

final todoProvider = cachedProvider<String?, RouteState>(
  initializer: (ref) => ref.read(routerProvider).todo,
  provider: routerProvider,
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
