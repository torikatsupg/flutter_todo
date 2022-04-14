import 'package:flutter_todo/firebase/auth_provider.dart';
import 'package:flutter_todo/firebase/authenticator_provider.dart';
import 'package:flutter_todo/provider/input/loading_provider.dart';
import 'package:flutter_todo/provider/input/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myPageControllerProvider = Provider((ref) => MyPageController(ref.read));

class MyPageController {
  MyPageController(this._reader);

  final Reader _reader;

  void signOut() {
    _reader(loadingProvider.notifier).run(() async {
      final result = await _reader(authenticatorProvider).signout();
      result.when(
        ok: (_) {
          _reader(authProvider.notifier).setUser(null);
          _reader(routerProvider.notifier).go('/signin');
        },
        err: (e) {
          switch (e) {
            case SignOutError.network:
              _reader(networkDialogProvider.notifier).show();
          }
        },
      );
    });
  }
}
