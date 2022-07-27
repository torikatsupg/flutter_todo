import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notFoundController = Provider<NotFoundController>(NotFoundController.new);

class NotFoundController {
  const NotFoundController(this._ref);
  final Ref _ref;

  void backHome() => _ref.read(routerProvider.notifier).go('/home');
}
