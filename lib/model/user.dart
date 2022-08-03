import 'package:flutter_todo/model/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required UserId userId,
    required String name,
  }) = _User;

  User._();
}

abstract class UserRepository<Err> {
  Future<Result<User, Err>> findById(UserId id);
}

@freezed
class UserId with _$UserId {
  factory UserId(String value) = _UserId;

  UserId._();
}
