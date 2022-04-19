import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeControllerProvider, int>((ref) {
  final tab = ref.watch(tabProvider);
  return HomeControllerProvider(ref.read, tab);
});

class HomeControllerProvider extends StateNotifier<int> {
  HomeControllerProvider(this._read, tab) : super(TabIndex.toIndex(tab));

  final Reader _read;

  void onTapTab(int value) =>
      _read(routerProvider.notifier).go('/home/${TabIndex.toParam(value)}');
}

class TabIndex {
  static const _map = {'todo': 0, 'mypage': 1};

  static int toIndex(String tab) => _map[tab]!;

  // param -> indexはparamが不明だが、idnex -> paramはparamが必ずわかる
  static String toParam(int index) {
    return _map.keys.firstWhere((e) => _map[e] == index);
  }
}
