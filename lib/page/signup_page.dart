import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/input/signup_controller_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(signupControllerProvider);
    final controller = ref.read(signupControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('signup'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => context.go('/signin'),
            child: const Text('to signin'),
          ),
          Column(
            children: [
              TextField(
                controller: state.email.controller,
                focusNode: state.email.focusNode,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  errorText: state.email.errors,
                  hintText: 'xxxx@example.com',
                  helperText: 'xxxx@example.com',
                  label: const Text('email'),
                ),
              ),
              TextField(
                controller: state.password.controller,
                focusNode: state.password.focusNode,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  errorText: state.password.errors,
                  hintText: 'more than 8 characters',
                  helperText: 'more than 8 characters',
                  label: const Text('password'),
                ),
              ),
              ElevatedButton(
                onPressed: controller.submit,
                child: const Text('submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
