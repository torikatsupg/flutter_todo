import 'package:flutter/material.dart';
import 'package:flutter_todo/view/component/my_form.dart';
import 'package:flutter_todo/view/page/signup_page/signup_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

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
            onPressed: controller.toSignin,
            child: const Text('to signin'),
          ),
          MyForm(
            model: state.email,
            onChanged: controller.onChangedEmail,
            hintText: 'xxxx@example.com',
            helperText: 'xxxx@example.com',
            label: 'email',
          ),
          MyForm(
            model: state.password,
            onChanged: controller.onChangedPassword,
            hintText: 'more than 8 characters',
            helperText: 'more than 8 characters',
            label: 'password',
          ),
          MyForm(
            model: state.confirmPassword,
            onChanged: controller.onChangedConfirmPassword,
            hintText: '',
            helperText: '',
            label: 'confirm password',
          ),
          ElevatedButton(
            onPressed: controller.submit,
            child: const Text('submit'),
          ),
        ],
      ),
    );
  }
}
