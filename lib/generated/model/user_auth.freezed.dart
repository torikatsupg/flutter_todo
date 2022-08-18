// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/user_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserAuth {
  AuthId get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAuthCopyWith<UserAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthCopyWith<$Res> {
  factory $UserAuthCopyWith(UserAuth value, $Res Function(UserAuth) then) =
      _$UserAuthCopyWithImpl<$Res>;
  $Res call({AuthId userId});

  $AuthIdCopyWith<$Res> get userId;
}

/// @nodoc
class _$UserAuthCopyWithImpl<$Res> implements $UserAuthCopyWith<$Res> {
  _$UserAuthCopyWithImpl(this._value, this._then);

  final UserAuth _value;
  // ignore: unused_field
  final $Res Function(UserAuth) _then;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as AuthId,
    ));
  }

  @override
  $AuthIdCopyWith<$Res> get userId {
    return $AuthIdCopyWith<$Res>(_value.userId, (value) {
      return _then(_value.copyWith(userId: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserAuthCopyWith<$Res> implements $UserAuthCopyWith<$Res> {
  factory _$$_UserAuthCopyWith(
          _$_UserAuth value, $Res Function(_$_UserAuth) then) =
      __$$_UserAuthCopyWithImpl<$Res>;
  @override
  $Res call({AuthId userId});

  @override
  $AuthIdCopyWith<$Res> get userId;
}

/// @nodoc
class __$$_UserAuthCopyWithImpl<$Res> extends _$UserAuthCopyWithImpl<$Res>
    implements _$$_UserAuthCopyWith<$Res> {
  __$$_UserAuthCopyWithImpl(
      _$_UserAuth _value, $Res Function(_$_UserAuth) _then)
      : super(_value, (v) => _then(v as _$_UserAuth));

  @override
  _$_UserAuth get _value => super._value as _$_UserAuth;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_UserAuth(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as AuthId,
    ));
  }
}

/// @nodoc

class _$_UserAuth extends _UserAuth {
  _$_UserAuth({required this.userId}) : super._();

  @override
  final AuthId userId;

  @override
  String toString() {
    return 'UserAuth(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAuth &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_UserAuthCopyWith<_$_UserAuth> get copyWith =>
      __$$_UserAuthCopyWithImpl<_$_UserAuth>(this, _$identity);
}

abstract class _UserAuth extends UserAuth {
  factory _UserAuth({required final AuthId userId}) = _$_UserAuth;
  _UserAuth._() : super._();

  @override
  AuthId get userId;
  @override
  @JsonKey(ignore: true)
  _$$_UserAuthCopyWith<_$_UserAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthIdCopyWith<AuthId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthIdCopyWith<$Res> {
  factory $AuthIdCopyWith(AuthId value, $Res Function(AuthId) then) =
      _$AuthIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$AuthIdCopyWithImpl<$Res> implements $AuthIdCopyWith<$Res> {
  _$AuthIdCopyWithImpl(this._value, this._then);

  final AuthId _value;
  // ignore: unused_field
  final $Res Function(AuthId) _then;

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
abstract class _$$_AuthIdCopyWith<$Res> implements $AuthIdCopyWith<$Res> {
  factory _$$_AuthIdCopyWith(_$_AuthId value, $Res Function(_$_AuthId) then) =
      __$$_AuthIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$_AuthIdCopyWithImpl<$Res> extends _$AuthIdCopyWithImpl<$Res>
    implements _$$_AuthIdCopyWith<$Res> {
  __$$_AuthIdCopyWithImpl(_$_AuthId _value, $Res Function(_$_AuthId) _then)
      : super(_value, (v) => _then(v as _$_AuthId));

  @override
  _$_AuthId get _value => super._value as _$_AuthId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_AuthId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthId extends _AuthId {
  _$_AuthId(this.value) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'AuthId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthId &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_AuthIdCopyWith<_$_AuthId> get copyWith =>
      __$$_AuthIdCopyWithImpl<_$_AuthId>(this, _$identity);
}

abstract class _AuthId extends AuthId {
  factory _AuthId(final String value) = _$_AuthId;
  _AuthId._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_AuthIdCopyWith<_$_AuthId> get copyWith =>
      throw _privateConstructorUsedError;
}
