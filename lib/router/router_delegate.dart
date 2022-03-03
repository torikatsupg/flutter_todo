import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/router/my_navigator.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RouterDelegateImpl extends RouterDelegate<Uri> with ChangeNotifier {
  RouterDelegateImpl(this.read) {
    _currentConfiguration = read(routeProvider);
    read(routeProvider.notifier).addListener((state) {
      _currentConfiguration = state;
      notifyListeners();
    });
  }

  final Reader read;
  late Uri _currentConfiguration;

  @override
  Widget build(BuildContext context) => const MyNavigator();

  @override
  Future<void> setInitialRoutePath(Uri configuration) =>
      SynchronousFuture(read(routeProvider.notifier).set(configuration));

  @override
  Future<void> setNewRoutePath(Uri configuration) =>
      SynchronousFuture(read(routeProvider.notifier).set(configuration));

  @override
  Future<bool> popRoute() => SynchronousFuture(false);

  @override
  Uri get currentConfiguration => _currentConfiguration;
}
