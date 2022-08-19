import 'package:flutter_todo/infrastructure/authenticator_provider.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/global_controller/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myPageControllerProvider = Provider(MyPageController.new);

class MyPageController {
  MyPageController(this._ref);

  final Ref _ref;

  void openSetting() => _ref.read(routerProvider).goNamed_(
        Routes.setting,
        params: {
          ParamKeys.tab: HomeTab.mypage.value,
        },
      );

  void openDebugPage() => _ref.read(routerProvider).goNamed_(
        Routes.debug,
      );

  void signOut() async {
    await _ref.read(loadingProvider.notifier).run(() async {
      final result = await _ref.read(authenticatorProvider).signout();
      result.maybeWhen(
        err: (e) {
          switch (e) {
            case SignOutError.network:
              _ref.read(networkDialogProvider.notifier).show();
          }
        },
        orElse: () {},
      );
    });
  }
}
