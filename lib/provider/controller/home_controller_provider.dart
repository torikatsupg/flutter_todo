import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, void>(
  (ref) => HomeController(ref.read),
);

class HomeController extends StateNotifier<void> {
  HomeController(this._read) : super(null);

  final Reader _read;

  int toIndex(String tab) => TabIndex.toIndex(tab);

  void onTapTab(int value) =>
      _read(routerProvider.notifier).go('/home/${TabIndex.toParam(value)}');
}

// TODO(torikatsu): enumにしたい
class TabIndex {
  static const _map = {'todo': 0, 'mypage': 1};

  static int toIndex(String tab) => _map[tab]!;

  // param -> indexはparamが不明だが、idnex -> paramはparamが必ずわかる
  static String toParam(int index) {
    return _map.keys.firstWhere((e) => _map[e] == index);
  }
}
