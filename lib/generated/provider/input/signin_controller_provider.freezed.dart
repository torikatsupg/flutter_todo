// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../provider/input/signin_controller_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$_SigninStateTearOff {
  const _$_SigninStateTearOff();

  __SigninInputState call(
      {required FormModel email, required FormModel password}) {
    return __SigninInputState(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const _$SigninState = _$_SigninStateTearOff();

/// @nodoc
mixin _$_SigninState {
  FormModel get email => throw _privateConstructorUsedError;
  FormModel get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$SigninStateCopyWith<_SigninState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SigninStateCopyWith<$Res> {
  factory _$SigninStateCopyWith(
          _SigninState value, $Res Function(_SigninState) then) =
      __$SigninStateCopyWithImpl<$Res>;
  $Res call({FormModel email, FormModel password});

  $FormModelCopyWith<$Res> get email;
  $FormModelCopyWith<$Res> get password;
}

/// @nodoc
class __$SigninStateCopyWithImpl<$Res> implements _$SigninStateCopyWith<$Res> {
  __$SigninStateCopyWithImpl(this._value, this._then);

  final _SigninState _value;
  // ignore: unused_field
  final $Res Function(_SigninState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormModel,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  @override
  $FormModelCopyWith<$Res> get email {
    return $FormModelCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value));
    });
  }

  @override
  $FormModelCopyWith<$Res> get password {
    return $FormModelCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value));
    });
  }
}

/// @nodoc
abstract class _$_SigninInputStateCopyWith<$Res>
    implements _$SigninStateCopyWith<$Res> {
  factory _$_SigninInputStateCopyWith(
          __SigninInputState value, $Res Function(__SigninInputState) then) =
      __$_SigninInputStateCopyWithImpl<$Res>;
  @override
  $Res call({FormModel email, FormModel password});

  @override
  $FormModelCopyWith<$Res> get email;
  @override
  $FormModelCopyWith<$Res> get password;
}

/// @nodoc
class __$_SigninInputStateCopyWithImpl<$Res>
    extends __$SigninStateCopyWithImpl<$Res>
    implements _$_SigninInputStateCopyWith<$Res> {
  __$_SigninInputStateCopyWithImpl(
      __SigninInputState _value, $Res Function(__SigninInputState) _then)
      : super(_value, (v) => _then(v as __SigninInputState));

  @override
  __SigninInputState get _value => super._value as __SigninInputState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(__SigninInputState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormModel,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }
}

/// @nodoc

class _$__SigninInputState extends __SigninInputState {
  _$__SigninInputState({required this.email, required this.password})
      : super._();

  @override
  final FormModel email;
  @override
  final FormModel password;

  @override
  String toString() {
    return '_SigninState(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is __SigninInputState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$_SigninInputStateCopyWith<__SigninInputState> get copyWith =>
      __$_SigninInputStateCopyWithImpl<__SigninInputState>(this, _$identity);
}

abstract class __SigninInputState extends _SigninState {
  factory __SigninInputState(
      {required FormModel email,
      required FormModel password}) = _$__SigninInputState;
  __SigninInputState._() : super._();

  @override
  FormModel get email;
  @override
  FormModel get password;
  @override
  @JsonKey(ignore: true)
  _$_SigninInputStateCopyWith<__SigninInputState> get copyWith =>
      throw _privateConstructorUsedError;
}
