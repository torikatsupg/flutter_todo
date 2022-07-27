import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/infrastructure/authenticator_provider.dart';
import 'package:flutter_todo/model/app_error.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/global_controller/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myPageControllerProvider = Provider((ref) => MyPageController(ref));

class MyPageController {
  MyPageController(this._ref);

  final Ref _ref;

  void openSetting() =>
      _ref.read(routerProvider.notifier).go('/home/mypage/setting');

  void signOut() async {
    await _ref.read(loadingProvider.notifier).run(() async {
      final user = _ref.read(authStreamProvider.future);
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
