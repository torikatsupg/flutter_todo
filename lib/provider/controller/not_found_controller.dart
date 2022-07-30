import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notFoundController = Provider<NotFoundController>(NotFoundController.new);

class NotFoundController {
  NotFoundController(Ref ref) : _read = ref.read;
  final Reader _read;

  void backHome() => _read(routerProvider.notifier).go('/home');
}
