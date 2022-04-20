import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/controller/error_controller_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.read(errorController);
    return Scaffold(
      appBar: AppBar(
        title: const Text('error'),
      ),
      body: Center(
        child: TextButton(
          onPressed: controller.backHome,
          child: const Text('back to home'),
        ),
      ),
    );
  }
}
