import 'package:hooks_riverpod/hooks_riverpod.dart';

final networkDialogProvider =
    StateNotifierProvider<NetworkDialogNotifier, bool>(
        (_) => NetworkDialogNotifier());

class NetworkDialogNotifier extends StateNotifier<bool> {
  NetworkDialogNotifier() : super(false);

  void show() {
    state = true;
  }

  void hide() {
    state = false;
  }
}
