import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/screen.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:flutter_todo/router/todo_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RouterDelegateImpl extends RouterDelegate<TodoPath> with ChangeNotifier {
  RouterDelegateImpl(this.read) {
    read(routeProvider.notifier).addListener((state) {
      _currentConfiguration = state;
      notifyListeners();
    });
    _currentConfiguration = read(routeProvider);
  }

  final Reader read;
  TodoPath _currentConfiguration = RootPath();

  @override
  Widget build(BuildContext context) {
    final route = _currentConfiguration;
    return Navigator(
      // key: navigatorKey,
      pages: [
        if (route is RootPath)
          MaterialPage(
            child: Screen(
              screenName: "Root",
              button: "toHome",
              onPressed: () => read(routeProvider.notifier).set(HomePath()),
            ),
          )
        else if (route is HomePath)
          MaterialPage(
            child: Screen(
              screenName: "Home",
              button: "toRoot",
              onPressed: () => read(routeProvider.notifier).set(RootPath()),
            ),
          )
      ],
      onPopPage: (route, result) => true,
    );
  }

  @override
  Future<void> setInitialRoutePath(TodoPath configuration) =>
      SynchronousFuture(() {
        read(routeProvider.notifier).set(configuration);
      }());

  @override
  Future<void> setNewRoutePath(TodoPath configuration) => SynchronousFuture(() {
        read(routeProvider.notifier).set(configuration);
      }());

  // TODO(torikatsu): implement
  @override
  Future<bool> popRoute() => SynchronousFuture(false); 
    // 外部からルートを変更されると呼ばれて、ここでアプリの状態を変更
    // ここではsetNewRoutePathの一個前のページに戻る際の処理に特化する
    // falseを返した場合アプリが閉じてホームに戻る挙動になる

  @override
  TodoPath get currentConfiguration => _currentConfiguration;
}
