import 'package:flutter/material.dart';
import 'package:flutter_todo/router/todo_path.dart';

class RouteInformationParserImpl extends RouteInformationParser<BasePath> {
  bool hasQuery(List<String> pathAndQuery) => pathAndQuery.length >= 2;

  Map<String, String> parseQuery(List<String> querys) => Map.fromEntries(
        querys
            .map((v) => v.split("="))
            .filter((v) => v.length == 2)
            .map((v) => MapEntry(v.first, v.last)),
      );

  @override
  Future<BasePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final location = routeInformation.location;
    final pathAndQuery = location?.split("?") ?? [];
    final paths = pathAndQuery.isNotEmpty ? pathAndQuery.first.split("/") : [];
    final querys = parseQuery(
        pathAndQuery.length >= 2 ? pathAndQuery.last.split("&") : []);

    final firstPath = paths.isNotEmpty ? paths.first : null;
    switch (firstPath) {
      case 'signin':
        return SigninPath();
      case 'signup':
        return SignupPath();
      case 'home':
        final secondPath = paths.length >= 2 ? paths[1] : null;
        switch (secondPath) {
          case 'todo':
            final thirdPath = paths.length >= 3 ? paths[2] : null;
            final tabIndex = tabQueryToIndex(querys);
            switch (thirdPath) {
              case 'id':
                final fourthPath = paths.length >= 4 ? paths[3] : null;
                switch (fourthPath.runtimeType) {
                  case String:
                    final fifthPath = paths.length >= 5 ? paths[4] : null;
                    switch (fifthPath) {
                      case 'edit':
                        return EditPath(fourthPath, tabIndex);
                      default:
                        return IdPath(fourthPath, tabIndex);
                    }
                  default:
                    return UnknownPath();
                }
              default:
                return TodoTabPathFactory.fromIndex(tabIndex);
            }
          case 'mypage':
            return MyPagePath();
          default:
            return UnknownPath();
        }
      default:
        return UnknownPath();
    }
  }

  int tabQueryToIndex(Map<String, String> querys) {
    const todoTabIndex = 0;
    const doneTabIndex = 1;
    switch (querys['tab']) {
      case 'todo':
        return todoTabIndex;
      case 'done':
        return doneTabIndex;
      default:
        return todoTabIndex;
    }
  }

  @override
  RouteInformation restoreRouteInformation(BasePath configuration) =>
      RouteInformation(location: configuration.location);
}

class Tuple2<T> {
  Tuple2(this.first, this.last);
  final T first;
  final T last;
}

extension IterableExt<T> on Iterable<T> {
  List<T> filter(bool Function(T) x) {
    final List<T> result = [];
    for (var e in this) {
      if (x(e)) result.add(e);
    }
    return result;
  }
}
