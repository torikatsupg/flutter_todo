import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/local/local_provider.dart';
import 'package:flutter_todo/view/component/my_form.dart';
import 'package:flutter_todo/view/page/setting_page/setting_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(localUserProvider);
    final state = ref.watch(settingPageControllerProvider(user));

    return Scaffold(
      appBar: AppBar(
        title: const Text('setting'),
      ),
      body: Column(
        children: [
          MyTextField(
            model: state.username,
            decoration: const InputDecoration(
              hintText: 'enter new username',
              helperText: 'enter new username',
              label: Text('username'),
            ),
          ),
          ElevatedButton(
            onPressed:
                ref.read(settingPageControllerProvider(user).notifier).onSubmit,
            child: const Text('submit'),
          )
        ],
      ),
    );
  }
}
