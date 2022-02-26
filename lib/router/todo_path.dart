abstract class BasePath {
  String get location;
}

class SignupPath extends BasePath {
  @override
  String get location => 'signup';
}

class SigninPath extends BasePath {
  @override
  String get location => '/signin';
}

abstract class HomePath extends BasePath {
  @override
  String get location => '/home';
  int get index;
}

abstract class TodoPath extends HomePath {
  @override
  String get location => '${super.location}/todo';

  @override
  int get index => 0;

  int get tabIndex;
}

class TodoTabPath extends TodoPath {
  @override
  String get location => '${super.location}?tab=todo';

  @override
  int get tabIndex => 0;
}

class DoneTabPath extends TodoPath {
  @override
  String get location => '${super.location}?tab=done';

  @override
  int get tabIndex => 1;
}

class MyPagePath extends HomePath {
  @override
  String get location => '${super.location}/mypage';

  @override
  int get index => 1;
}

class HomePathFactory {
  HomePathFactory._();

  static HomePath fromIndex(int index, int tabIndex) {
    if (index == 0) {
      return TodoTabPathFactory.fromIndex(tabIndex);
    } else if (index == 1) {
      return MyPagePath();
    } else {
      throw UnimplementedError();
    }
  }
}

class TodoTabPathFactory {
  TodoTabPathFactory._();

  static TodoPath fromIndex(int tabIndex) {
    if (tabIndex == 0) {
      return TodoTabPath();
    } else if (tabIndex == 1) {
      return DoneTabPath();
    } else {
      throw UnimplementedError();
    }
  }
}
