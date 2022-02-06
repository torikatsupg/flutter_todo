abstract class TodoPath {
  late final String createdAt;
}

class RootPath extends TodoPath {
  RootPath() {
    createdAt = DateTime.now().toIso8601String();
  }

  @override
  String toString() {
    return 'Root: $hashCode $createdAt';
  }
}

class HomePath extends TodoPath {
  HomePath() {
    createdAt = DateTime.now().toIso8601String();
  }

  @override
  String toString() {
    return 'Home: $hashCode $createdAt';
  }
}
