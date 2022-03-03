import 'package:flutter/material.dart';
import 'package:flutter_todo/component/screen.dart';
import 'package:flutter_todo/component/tree.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyNavigator extends ConsumerWidget {
  const MyNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      pages: Node(
        path: 'A',
        page: const MaterialPage(child: Screen(name: 'A')),
        children: [
          Node(
            path: 'B',
            page: const MaterialPage(child: Screen(name: 'B')),
          ),
          Node(
            path: 'C',
            page: const MaterialPage(child: Screen(name: 'C')),
            children: [
              Node(
                path: 'D',
                page: const MaterialPage(child: Screen(name: 'D')),
                children: [
                  Node(
                    path: 'G',
                    page: const MaterialPage(child: Screen(name: 'G')),
                  ),
                ],
              ),
              Node(
                path: 'E',
                page: const MaterialPage(child: Screen(name: 'E')),
              ),
              Node(
                path: 'F',
                page: const MaterialPage(child: Screen(name: 'F')),
              ),
            ],
          ),
        ],
      ).build(ref.watch(routeProvider)),
      onPopPage: (route, result) {
        print(route);
        print(result);
        return ref.read(routeProvider.notifier).pop();
      },
    );
  }
}
