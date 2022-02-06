import 'package:flutter/material.dart';
import 'package:flutter_todo/router/todo_path.dart';

class RouteInformationParserImpl extends RouteInformationParser<TodoPath> {

  @override
  Future<TodoPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == '/root') {
      return RootPath();
    } else if (routeInformation.location == '/home') {
      return HomePath();
    } else {
      return RootPath();
    }
  }

  @override
  RouteInformation restoreRouteInformation(TodoPath configuration) {
    if (configuration is RootPath) {
      return const RouteInformation(location: '/root');
    } else if (configuration is HomePath) {
      return const RouteInformation(location: '/home');
    } else {
      return const RouteInformation(location: '/root');
    }
  }
}
