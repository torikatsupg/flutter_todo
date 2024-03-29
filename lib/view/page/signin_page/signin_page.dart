import 'package:flutter/material.dart';
import 'package:flutter_todo/view/component/my_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'signin_page_controller.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(context, ref) {
    final state = ref.watch(signinControllerProvider);
    final controller = ref.read(signinControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('signin'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: controller.toSignup,
            child: const Text('to signup'),
          ),
          MyTextField(
            model: state.email,
            decoration: const InputDecoration(
              hintText: 'xxxx@example.com',
              helperText: 'xxxx@example.com',
              label: Text('email'),
            ),
          ),
          MyTextField(
            model: state.password,
            decoration: const InputDecoration(
              hintText: 'more than 8 characters',
              helperText: 'more than 8 characters',
              label: Text('password'),
            ),
          ),
          ElevatedButton(
            onPressed: controller.submit,
            child: const Text('signin'),
          ),
        ],
      ),
    );
  }
}
