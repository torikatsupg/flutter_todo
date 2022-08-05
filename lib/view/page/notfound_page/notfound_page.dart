import 'package:flutter/material.dart';
import 'package:flutter_todo/view/page/notfound_page/not_found_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotFoundPage extends ConsumerWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.read(notFoundController);
    return Scaffold(
      appBar: AppBar(
        title: const Text('not found'),
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
