import 'package:flutter/material.dart';

class Id extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return const Scaffold(
          body: Center(
            child: Text('id'),
          ),
        );
      },
    );
  }
}
