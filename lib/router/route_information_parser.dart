import 'package:flutter/material.dart';
import 'package:flutter_todo/router/todo_path.dart';

class RouteInformationParserImpl extends RouteInformationParser<BasePath> {
  @override
  Future<BasePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == '/signin') {
      return SigninPath();
    } else if (routeInformation.location == '/signup') {
      return SignupPath();
    } else if (routeInformation.location == '/home/todo?tab=todo') {
      return TodoTabPath();
    } else if (routeInformation.location == '/home/todo?tab=done') {
      return DoneTabPath();
    } else if (routeInformation.location == '/home/todo') {
      return TodoTabPath();
    } else if (routeInformation.location == '/home/mypage') {
      return MyPagePath();
    } else if (routeInformation.location == '/home') {
      return TodoTabPath();
    } else {
      return TodoTabPath();
    }
  }

  @override
  RouteInformation restoreRouteInformation(BasePath configuration) =>
      RouteInformation(location: configuration.location);
}
