import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routeProvider =
     StateNotifierProvider<_RouteNotifier, TodoPath>((_) => _RouteNotifier());

class _RouteNotifier extends StateNotifier<TodoPath> {
  _RouteNotifier() : super(RootPath());

  void set(TodoPath path) => state = path;
}
