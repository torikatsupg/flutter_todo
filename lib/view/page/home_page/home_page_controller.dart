import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, void>(
  HomeController.new,
);

class HomeController extends StateNotifier<void> {
  HomeController(Ref ref)
      : _read = ref.read,
        super(null);

  final Reader _read;

  void onTapTab(int index) => _read(routerProvider).goNamed_(
        Routes.home,
        params: {
          ParamKeys.tab: HomeTab.fromIndex(index).value,
        },
      );
}
