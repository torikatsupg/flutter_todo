import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('register page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => ref.read(routerProvider).go('/signin'),
            child: Text('signin'),
          ),
          ElevatedButton(
            onPressed: () => ref.read(routerProvider).go('/signup'),
            child: Text('signup'),
          ),
          ElevatedButton(
            onPressed: () => ref.read(routerProvider).go('/register'),
            child: Text('register'),
          ),
          ElevatedButton(
            onPressed: () => ref.read(routerProvider).go('/home'),
            child: Text('home'),
          ),
        ],
      ),
    );
  }
}
