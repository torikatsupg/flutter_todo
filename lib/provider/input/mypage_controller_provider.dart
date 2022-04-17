import 'package:flutter_todo/firebase/auth_provider.dart';
import 'package:flutter_todo/firebase/authenticator_provider.dart';
import 'package:flutter_todo/model/app_error.dart';
import 'package:flutter_todo/provider/input/loading_provider.dart';
import 'package:flutter_todo/provider/input/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myPageControllerProvider = Provider((ref) => MyPageController(ref));

class MyPageController {
  MyPageController(this._ref);

  final Ref _ref;

  void signOut() async {
    await _ref.read(loadingProvider.notifier).run(() async {
      final user = _ref.read(authStreamProvider.stream).first;
      final result = await _ref.read(authenticatorProvider).signout();
      result.when(
        ok: (_) async {
          if (await user == null) {
            _ref.read(routerProvider.notifier).go('/signin');
          } else {
            throw AppError.unknown();
          }
        },
        err: (e) {
          switch (e) {
            case SignOutError.network:
              _ref.read(networkDialogProvider.notifier).show();
          }
        },
      );
    });
  }
}
