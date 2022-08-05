import 'package:flutter/material.dart';
import 'package:flutter_todo/view/page/error_page/error_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

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
