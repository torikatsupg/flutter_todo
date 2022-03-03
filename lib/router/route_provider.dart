import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteProvider = StateNotifierProvider<RouteNotifier, Uri>;

final routeProvider =
    StateNotifierProvider<RouteNotifier, Uri>((_) => RouteNotifier());

class RouteNotifier extends StateNotifier<Uri> {
  RouteNotifier() : super(Uri());

  void set(Uri uri) => state = uri;

  bool pop() {
    final nextPaths = state.path.split("/")..removeLast();
    state = Uri(path: nextPaths.join("/"));
    return true;
  }
}
