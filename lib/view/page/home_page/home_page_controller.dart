import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, void>(
  HomeController.new,
);

class HomeController extends StateNotifier<void> {
  HomeController(this._ref) : super(null);

  final Ref _ref;

  void onTapTab(int index) => _ref.read(routerProvider).goNamed_(
        Routes.home,
        params: {
          ParamKeys.tab: HomeTab.fromIndex(index).value,
        },
      );
}
