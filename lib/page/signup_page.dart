import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/firebase/auth_provider.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/input/signup_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(context, ref) {
    final state = ref.watch(signupProvider);
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
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: state.email,
                  onSaved: (value) =>
                      ref.read(signupProvider.notifier).setEmail(value!),
                  decoration: const InputDecoration(
                    hintText: 'xxxx@example.com',
                    label: Text('email'),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: emailValidator,
                ),
                TextFormField(
                  initialValue: state.password,
                  onSaved: (value) =>
                      ref.read(signupProvider.notifier).setPassword(value!),
                  decoration: const InputDecoration(
                    label: Text('password'),
                  ),
                  validator: passwordValidator,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ref.read(signupProvider.notifier).submit();
                    }
                  },
                  child: const Text('submit'),
                ),
                ElevatedButton(
                  onPressed: () => print(ref.read(signupProvider)),
                  child: const Text('print'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
