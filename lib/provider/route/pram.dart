enum HomeTab {
  task(0, 'task'),
  mypage(1, 'mypage');

  const HomeTab(this.i, this.value);

  final int i;
  final String value;

  factory HomeTab.fromIndex(int index) {
    return HomeTab.values[index];
  }

  static HomeTab? parse(String? param) {
    try {
      return HomeTab.values.firstWhere(
        (e) => e.value == param,
      );
    } catch (e) {
      return null;
    }
  }
}

enum InnerTab {
  todo(0, 'todo'),
  done(1, 'done');

  const InnerTab(this.i, this.value);

  final int i;
  final String value;

  static const _defaultInnerTab = todo;

  factory InnerTab.fromIndex(int index) {
    return InnerTab.values[index];
  }

  static InnerTab parse(String? param) {
    return InnerTab.values.firstWhere(
      (e) => e.value == param,
      orElse: () => InnerTab._defaultInnerTab,
    );
  }
}
