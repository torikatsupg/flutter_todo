import 'package:flutter/material.dart';
import 'package:flutter_todo/component/dialog_overlay.dart';
import 'package:flutter_todo/provider/input/signin_controller_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(signinControllerProvider);
    final controller = ref.read(signinControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('signin'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              TextButton(
                onPressed: () => ref.read(routerProvider).go('/signup'),
                child: const Text('to signup'),
              ),
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
                child: const Text('signin'),
              ),
            ],
          ),
          if (state.showNetworkError)
            // TODO(torikatsu): animation
            DialogOverlay(
              onTap: controller.hideNetworkErrorDialog,
              child: const AlertDialog(
                title: Text('ネットワークエラー'),
                content: Text('通信に失敗しました。時間をあけてお試しください'),
              ),
            ),
        ],
      ),
    );
  }
}
