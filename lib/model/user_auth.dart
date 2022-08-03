import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/user_auth.freezed.dart';

@freezed
class UserAuth with _$UserAuth {
  factory UserAuth({required AuthId userId}) = _UserAuth;

  UserAuth._();
}

@freezed
class AuthId with _$AuthId {
  factory AuthId(String value) = _AuthId;

  AuthId._();
}
