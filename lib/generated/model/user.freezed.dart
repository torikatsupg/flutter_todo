// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  UserId get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({UserId userId, String username});

  $UserIdCopyWith<$Res> get userId;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserId,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserIdCopyWith<$Res> get userId {
    return $UserIdCopyWith<$Res>(_value.userId, (value) {
      return _then(_value.copyWith(userId: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call({UserId userId, String username});

  @override
  $UserIdCopyWith<$Res> get userId;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
  }) {
    return _then(_$_User(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserId,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_User extends _User {
  _$_User({required this.userId, required this.username}) : super._();

  @override
  final UserId userId;
  @override
  final String username;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User extends User {
  factory _User(
      {required final UserId userId, required final String username}) = _$_User;
  _User._() : super._();

  @override
  UserId get userId => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserIdCopyWith<UserId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserIdCopyWith<$Res> {
  factory $UserIdCopyWith(UserId value, $Res Function(UserId) then) =
      _$UserIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$UserIdCopyWithImpl<$Res> implements $UserIdCopyWith<$Res> {
  _$UserIdCopyWithImpl(this._value, this._then);

  final UserId _value;
  // ignore: unused_field
  final $Res Function(UserId) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserIdCopyWith<$Res> implements $UserIdCopyWith<$Res> {
  factory _$$_UserIdCopyWith(_$_UserId value, $Res Function(_$_UserId) then) =
      __$$_UserIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$_UserIdCopyWithImpl<$Res> extends _$UserIdCopyWithImpl<$Res>
    implements _$$_UserIdCopyWith<$Res> {
  __$$_UserIdCopyWithImpl(_$_UserId _value, $Res Function(_$_UserId) _then)
      : super(_value, (v) => _then(v as _$_UserId));

  @override
  _$_UserId get _value => super._value as _$_UserId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_UserId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserId extends _UserId {
  _$_UserId(this.value) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'UserId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserId &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_UserIdCopyWith<_$_UserId> get copyWith =>
      __$$_UserIdCopyWithImpl<_$_UserId>(this, _$identity);
}

abstract class _UserId extends UserId {
  factory _UserId(final String value) = _$_UserId;
  _UserId._() : super._();

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserIdCopyWith<_$_UserId> get copyWith =>
      throw _privateConstructorUsedError;
}
