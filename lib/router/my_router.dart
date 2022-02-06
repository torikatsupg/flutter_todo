import 'package:flutter/material.dart';
import 'package:flutter_todo/router/route_information_parser.dart';
import 'package:flutter_todo/router/router_delegate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyRouter extends ConsumerStatefulWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyRouterState();
}

class _MyRouterState extends ConsumerState<MyRouter> {
  _MyRouterState();

  late final RouteInformationParserImpl _routeInformationParser;
  late final RouterDelegateImpl _routerDelegate;

  @override
  void initState() {
    _routeInformationParser = RouteInformationParserImpl();
    _routerDelegate = RouterDelegateImpl((context as WidgetRef).read);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate
    );
  }
}
