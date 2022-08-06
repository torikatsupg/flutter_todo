import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskScreenControllerProvider = Provider<TaskScreenController>(TaskScreenController.new);

class TaskScreenController {
  TaskScreenController(Ref ref) : _read = ref.read;
  final Reader _read;

  void onTap(int index) {
    _read(routerProvider).go_(
      '/home/todo',
      queryParameters: {'todo': fromIndex(index)},
    );
  }

  void toDetailPage(String id) => _read(routerProvider).go_('/home/todo/$id');

  void onTapFab() => _read(routerProvider).go_('/home/todo/create');
}

String fromIndex(int index) {
  switch (index) {
    case 0:
      return 'todo';
    case 1:
      return 'done';
    default:
      throw UnimplementedError();
  }
}

int toIndex(String? query) {
  switch (query) {
    case 'todo':
      return 0;
    case 'done':
      return 1;
    default:
      return 0;
  }
}
