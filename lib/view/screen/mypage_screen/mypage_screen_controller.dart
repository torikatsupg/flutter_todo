import 'package:flutter_todo/infrastructure/authenticator_provider.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/global_controller/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myPageControllerProvider = Provider(MyPageController.new);

class MyPageController {
  MyPageController(Ref ref) : _read = ref.read;

  final Reader _read;

  void openSetting() => _read(routerProvider).goNamed_(
        Routes.setting,
        params: {
          ParamKeys.tab: HomeTab.mypage.value,
        },
      );

  void signOut() async {
    await _read(loadingProvider.notifier).run(() async {
      final result = await _read(authenticatorProvider).signout();
      result.maybeWhen(
        err: (e) {
          switch (e) {
            case SignOutError.network:
              _read(networkDialogProvider.notifier).show();
          }
        },
        orElse: () {},
      );
    });
  }
}
