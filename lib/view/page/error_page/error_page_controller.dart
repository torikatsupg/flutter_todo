import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorController = Provider<ErrorController>(ErrorController.new);

class ErrorController {
  ErrorController(this._ref);
  final Ref _ref;

  void backHome() => _ref.read(routerProvider).goNamed_(
        Routes.home,
        params: {
          ParamKeys.tab: HomeTab.task.value,
        },
      );
}
