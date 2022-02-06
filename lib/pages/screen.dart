import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Screen extends StatelessWidget {
  const Screen(
      {required this.screenName,
      required this.onPressed,
      required this.button,
      Key? key})
      : super(key: key);

  final String screenName;
  final String button;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(screenName),
            Consumer(
              builder: (context, ref, _) {
                return ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('to root'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
