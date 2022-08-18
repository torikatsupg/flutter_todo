// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../view/page/register_page/register_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterPageState {
  FormModel get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterPageStateCopyWith<RegisterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPageStateCopyWith<$Res> {
  factory $RegisterPageStateCopyWith(
          RegisterPageState value, $Res Function(RegisterPageState) then) =
      _$RegisterPageStateCopyWithImpl<$Res>;
  $Res call({FormModel username});

  $FormModelCopyWith<$Res> get username;
}

/// @nodoc
class _$RegisterPageStateCopyWithImpl<$Res>
    implements $RegisterPageStateCopyWith<$Res> {
  _$RegisterPageStateCopyWithImpl(this._value, this._then);

  final RegisterPageState _value;
  // ignore: unused_field
  final $Res Function(RegisterPageState) _then;

  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  @override
  $FormModelCopyWith<$Res> get username {
    return $FormModelCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value));
    });
  }
}

/// @nodoc
abstract class _$$_RegisterPageStateCopyWith<$Res>
    implements $RegisterPageStateCopyWith<$Res> {
  factory _$$_RegisterPageStateCopyWith(_$_RegisterPageState value,
          $Res Function(_$_RegisterPageState) then) =
      __$$_RegisterPageStateCopyWithImpl<$Res>;
  @override
  $Res call({FormModel username});

  @override
  $FormModelCopyWith<$Res> get username;
}

/// @nodoc
class __$$_RegisterPageStateCopyWithImpl<$Res>
    extends _$RegisterPageStateCopyWithImpl<$Res>
    implements _$$_RegisterPageStateCopyWith<$Res> {
  __$$_RegisterPageStateCopyWithImpl(
      _$_RegisterPageState _value, $Res Function(_$_RegisterPageState) _then)
      : super(_value, (v) => _then(v as _$_RegisterPageState));

  @override
  _$_RegisterPageState get _value => super._value as _$_RegisterPageState;

  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_$_RegisterPageState(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }
}

/// @nodoc

class _$_RegisterPageState extends _RegisterPageState {
  _$_RegisterPageState({required this.username}) : super._();

  @override
  final FormModel username;

  @override
  String toString() {
    return 'RegisterPageState(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterPageState &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterPageStateCopyWith<_$_RegisterPageState> get copyWith =>
      __$$_RegisterPageStateCopyWithImpl<_$_RegisterPageState>(
          this, _$identity);
}

abstract class _RegisterPageState extends RegisterPageState {
  factory _RegisterPageState({required final FormModel username}) =
      _$_RegisterPageState;
  _RegisterPageState._() : super._();

  @override
  FormModel get username;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterPageStateCopyWith<_$_RegisterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
