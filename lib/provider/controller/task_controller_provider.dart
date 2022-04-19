import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskControllerProvider =
    StateNotifierProvider<TaskController, int>((ref) {
  final query = ref.read(tabProvider);
  return TaskController(ref.read, query);
});

class TaskController extends StateNotifier<int> {
  TaskController(this._read, query) : super(toIndex(query));
  final Reader _read;

  void onTap(int index) {
    _read(routerProvider.notifier).go(
      '/home/todo',
      queryParameters: {'todo': fromIndex(index)},
    );
  }

  void onTapFab() => _read(routerProvider.notifier).go('/home/todo/create');
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
