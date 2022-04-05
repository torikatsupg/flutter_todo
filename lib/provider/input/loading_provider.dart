import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loadingProvider =
    StateNotifierProvider<LoadingNotifier, bool>((_) => LoadingNotifier());

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier() : super(false);

  Future<void> run(AsyncCallback asyncCallback) async {
    state = true;
    await asyncCallback();
    state = false;
  }
}
