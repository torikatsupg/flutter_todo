import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/router/my_navigator.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RouterDelegateImpl extends RouterDelegate<BasePath> with ChangeNotifier {
  RouterDelegateImpl(this.read) {
    _currentConfiguration = read(routeProvider);
    read(routeProvider.notifier).addListener((state) {
      _currentConfiguration = state;
      notifyListeners();
    });
  }

  final Reader read;
  late BasePath _currentConfiguration;

  @override
  Widget build(BuildContext context) => const MyNavigator();

  @override
  Future<void> setInitialRoutePath(BasePath configuration) =>
      SynchronousFuture(read(routeProvider.notifier).set(configuration));

  @override
  Future<void> setNewRoutePath(BasePath configuration) =>
      SynchronousFuture(read(routeProvider.notifier).set(configuration));

  @override
  Future<bool> popRoute() => SynchronousFuture(false);

  @override
  BasePath get currentConfiguration => _currentConfiguration;
}
