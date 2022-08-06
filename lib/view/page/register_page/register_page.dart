import 'package:flutter/material.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
// import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/view/page/register_page/register_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userId = UserId.fromAuthId(ref.read(localAuthProvider).userId);
    final state = ref.watch(
      registerPageControllerProvider(userId),
    );
    final controller =
        ref.read(registerPageControllerProvider(userId).notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('register page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: state.username.controller,
            focusNode: state.username.focusNode,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorText: state.username.errors,
              hintText: 'username',
              helperText: 'username',
              label: const Text('username'),
            ),
          ),
          ElevatedButton(
            onPressed: controller.submit,
            child: const Text('submit and register'),
          ),
        ],
      ),
    );
  }
}
