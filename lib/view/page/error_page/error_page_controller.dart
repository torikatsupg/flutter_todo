import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorController = Provider<ErrorController>(ErrorController.new);

class ErrorController {
  ErrorController(Ref ref) : _read = ref.read;
  final Reader _read;

  void backHome() => _read(routerProvider).go_('/home');
}