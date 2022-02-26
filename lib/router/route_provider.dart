import 'package:flutter/material.dart';
import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef RouteProvider = StateNotifierProvider<RouteNotifier, BasePath>;

final routeProvider =
    StateNotifierProvider<RouteNotifier, BasePath>((_) => RouteNotifier());

class RouteNotifier extends StateNotifier<BasePath> {
  RouteNotifier() : super(TodoTabPath());

  void set(BasePath path) => state = path;

  void setIndex(int index) => state = HomePathFactory.fromIndex(index, 0);

  void setTabIndex(int tabIndex) =>
      state = TodoTabPathFactory.fromIndex(tabIndex);

  bool pop() => false;
}

// =======

final homeRouteProvider = Provider<HomePath>((_) => throw UnimplementedError());

final todoRouteProvider = Provider<TodoPath>((_) => throw UnimplementedError());
