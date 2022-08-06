import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/user_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required UserId userId,
    required String username,
  }) = _User;

  User._();
}

abstract class UserRepository<Err> {
  Future<Result<User, Err>> findById(UserId id);
  Future<Result<User, Err>> register({
    required UserId id,
    required String username,
  });
}

@freezed
class UserId with _$UserId {
  factory UserId(String value) = _UserId;

  factory UserId.fromAuthId(AuthId id) => UserId(id.value);

  UserId._();
}
