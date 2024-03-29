// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../view/page/signup_page/signup_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$_SignupState {
  FormModel get email => throw _privateConstructorUsedError;
  FormModel get password => throw _privateConstructorUsedError;
  FormModel get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(
          _SignupState value, $Res Function(_SignupState) then) =
      __$SignupStateCopyWithImpl<$Res>;
  $Res call({FormModel email, FormModel password, FormModel confirmPassword});

  $FormModelCopyWith<$Res> get email;
  $FormModelCopyWith<$Res> get password;
  $FormModelCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class __$SignupStateCopyWithImpl<$Res> implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._value, this._then);

  final _SignupState _value;
  // ignore: unused_field
  final $Res Function(_SignupState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
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
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
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

  @override
  $FormModelCopyWith<$Res> get confirmPassword {
    return $FormModelCopyWith<$Res>(_value.confirmPassword, (value) {
      return _then(_value.copyWith(confirmPassword: value));
    });
  }
}

/// @nodoc
abstract class _$$__SignupInputStateCopyWith<$Res>
    implements _$SignupStateCopyWith<$Res> {
  factory _$$__SignupInputStateCopyWith(_$__SignupInputState value,
          $Res Function(_$__SignupInputState) then) =
      __$$__SignupInputStateCopyWithImpl<$Res>;
  @override
  $Res call({FormModel email, FormModel password, FormModel confirmPassword});

  @override
  $FormModelCopyWith<$Res> get email;
  @override
  $FormModelCopyWith<$Res> get password;
  @override
  $FormModelCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class __$$__SignupInputStateCopyWithImpl<$Res>
    extends __$SignupStateCopyWithImpl<$Res>
    implements _$$__SignupInputStateCopyWith<$Res> {
  __$$__SignupInputStateCopyWithImpl(
      _$__SignupInputState _value, $Res Function(_$__SignupInputState) _then)
      : super(_value, (v) => _then(v as _$__SignupInputState));

  @override
  _$__SignupInputState get _value => super._value as _$__SignupInputState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_$__SignupInputState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormModel,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormModel,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }
}

/// @nodoc

class _$__SignupInputState extends __SignupInputState {
  _$__SignupInputState(
      {required this.email,
      required this.password,
      required this.confirmPassword})
      : super._();

  @override
  final FormModel email;
  @override
  final FormModel password;
  @override
  final FormModel confirmPassword;

  @override
  String toString() {
    return '_SignupState(email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__SignupInputState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword));

  @JsonKey(ignore: true)
  @override
  _$$__SignupInputStateCopyWith<_$__SignupInputState> get copyWith =>
      __$$__SignupInputStateCopyWithImpl<_$__SignupInputState>(
          this, _$identity);
}

abstract class __SignupInputState extends _SignupState {
  factory __SignupInputState(
      {required final FormModel email,
      required final FormModel password,
      required final FormModel confirmPassword}) = _$__SignupInputState;
  __SignupInputState._() : super._();

  @override
  FormModel get email;
  @override
  FormModel get password;
  @override
  FormModel get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$__SignupInputStateCopyWith<_$__SignupInputState> get copyWith =>
      throw _privateConstructorUsedError;
}
