import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/user_auth.freezed.dart';

@freezed
class UserAuth with _$UserAuth {
  factory UserAuth({required UserId userId}) = _UserAuth;

  UserAuth._();
}

@freezed
class UserId with _$UserId {
  factory UserId(String value) = _UserId;

  UserId._();
}
