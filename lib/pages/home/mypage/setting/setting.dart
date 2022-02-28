import 'package:flutter/material.dart';

class Setting extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return const Scaffold(
          body: Center(
            child: Text('setting'),
          ),
        );
      },
    );
  }
}
