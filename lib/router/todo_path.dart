abstract class BasePath {
  String get location => '$paths?$querys';
  String get paths;
  String get querys;
}

class UnknownPath extends BasePath {
  @override
  String get paths => '/unknown';

  @override
  String get querys => '';
}

class SignupPath extends BasePath {
  @override
  String get paths => '/signup';

  @override
  String get querys => '';
}

class SigninPath extends BasePath {
  @override
  String get paths => '/signin';

  @override
  String get querys => '';
}

abstract class HomePath extends BasePath {
  @override
  String get paths => '/home';

  @override
  String get querys => '';
  int get index;
}

abstract class TodoPath extends HomePath {
  @override
  String get paths => '${super.paths}/todo';

  @override
  String get querys => '';

  @override
  int get index => 0;

  int get tabIndex;
}

class TodoTabPath extends TodoPath {
  @override
  String get paths => '${super.paths}/todo';

  @override
  String get querys => 'tab=todo';

  @override
  int get tabIndex => 0;
}

class DoneTabPath extends TodoPath {
  @override
  String get paths => '${super.paths}/todo';

  @override
  String get querys => 'tab=done';

  @override
  int get tabIndex => 1;
}

class IdPath extends TodoPath {
  IdPath(this.id, this.tabIndex);
  final String id;

  @override
  final int tabIndex;

  @override
  String get paths => '${super.paths}/id/$id';
  
  @override
  String get querys => '';
}

class EditPath extends IdPath {
  EditPath(String id, int tabIndex) : super(id, tabIndex);

  @override
  String get paths => '${super.paths}/edit';
  @override
  String get querys => '';
}

class MyPagePath extends HomePath {
  @override
  String get location => '${super.paths}/mypage';
  @override
  String get querys => '';

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
