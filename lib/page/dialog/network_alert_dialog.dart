import 'package:flutter/material.dart';
import 'package:flutter_todo/component/custom_modal_barriere.dart';
import 'package:flutter_todo/provider/input/network_dialog_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NetworkAlertDialog extends ConsumerWidget {
  const NetworkAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(networkDialogProvider);
    final controller = ref.read(networkDialogProvider.notifier);
    return CustomModalBarriere(
      show: state,
      onTap: controller.hide,
      child: MaterialApp(
        home: AlertDialog(
          title: const Text('ネットワークエラー'),
          content: const Text('通信に失敗しました。時間をあけてお試しください'),
          actions: [
            TextButton(
              onPressed: controller.hide,
              child: const Text('ok'),
            ),
          ],
        ),
      ),
    );
  }
}
