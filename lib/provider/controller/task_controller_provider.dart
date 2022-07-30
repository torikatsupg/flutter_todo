import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskControllerProvider = StateNotifierProvider<TaskController, int>(
  (ref) {
    // TODO(torikatsu): fix
    const query = "todo";
    return TaskController(ref.read, query);
  },
);

class TaskController extends StateNotifier<int> {
  TaskController(this._read, query) : super(toIndex(query));
  final Reader _read;

  void onTap(int index) {
    _read(routerProvider).go_(
      '/home/todo',
      _read,
      queryParameters: {'todo': fromIndex(index)},
    );
  }

  void toDetailPage(String id) =>
      _read(routerProvider).go_('/home/todo/$id', _read);

  void onTapFab() => _read(routerProvider).go_('/home/todo/create', _read);
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
