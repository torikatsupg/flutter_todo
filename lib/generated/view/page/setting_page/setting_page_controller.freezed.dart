// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../view/page/setting_page/setting_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingPageState {
  User get initUser => throw _privateConstructorUsedError;
  FormModel get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingPageStateCopyWith<SettingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingPageStateCopyWith<$Res> {
  factory $SettingPageStateCopyWith(
          SettingPageState value, $Res Function(SettingPageState) then) =
      _$SettingPageStateCopyWithImpl<$Res>;
  $Res call({User initUser, FormModel username});

  $UserCopyWith<$Res> get initUser;
  $FormModelCopyWith<$Res> get username;
}

/// @nodoc
class _$SettingPageStateCopyWithImpl<$Res>
    implements $SettingPageStateCopyWith<$Res> {
  _$SettingPageStateCopyWithImpl(this._value, this._then);

  final SettingPageState _value;
  // ignore: unused_field
  final $Res Function(SettingPageState) _then;

  @override
  $Res call({
    Object? initUser = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      initUser: initUser == freezed
          ? _value.initUser
          : initUser // ignore: cast_nullable_to_non_nullable
              as User,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  @override
  $UserCopyWith<$Res> get initUser {
    return $UserCopyWith<$Res>(_value.initUser, (value) {
      return _then(_value.copyWith(initUser: value));
    });
  }

  @override
  $FormModelCopyWith<$Res> get username {
    return $FormModelCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value));
    });
  }
}

/// @nodoc
abstract class _$$_SettingPageStateCopyWith<$Res>
    implements $SettingPageStateCopyWith<$Res> {
  factory _$$_SettingPageStateCopyWith(
          _$_SettingPageState value, $Res Function(_$_SettingPageState) then) =
      __$$_SettingPageStateCopyWithImpl<$Res>;
  @override
  $Res call({User initUser, FormModel username});

  @override
  $UserCopyWith<$Res> get initUser;
  @override
  $FormModelCopyWith<$Res> get username;
}

/// @nodoc
class __$$_SettingPageStateCopyWithImpl<$Res>
    extends _$SettingPageStateCopyWithImpl<$Res>
    implements _$$_SettingPageStateCopyWith<$Res> {
  __$$_SettingPageStateCopyWithImpl(
      _$_SettingPageState _value, $Res Function(_$_SettingPageState) _then)
      : super(_value, (v) => _then(v as _$_SettingPageState));

  @override
  _$_SettingPageState get _value => super._value as _$_SettingPageState;

  @override
  $Res call({
    Object? initUser = freezed,
    Object? username = freezed,
  }) {
    return _then(_$_SettingPageState(
      initUser: initUser == freezed
          ? _value.initUser
          : initUser // ignore: cast_nullable_to_non_nullable
              as User,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }
}

/// @nodoc

class _$_SettingPageState extends _SettingPageState {
  _$_SettingPageState({required this.initUser, required this.username})
      : super._();

  @override
  final User initUser;
  @override
  final FormModel username;

  @override
  String toString() {
    return 'SettingPageState(initUser: $initUser, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingPageState &&
            const DeepCollectionEquality().equals(other.initUser, initUser) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initUser),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_SettingPageStateCopyWith<_$_SettingPageState> get copyWith =>
      __$$_SettingPageStateCopyWithImpl<_$_SettingPageState>(this, _$identity);
}

abstract class _SettingPageState extends SettingPageState {
  factory _SettingPageState(
      {required final User initUser,
      required final FormModel username}) = _$_SettingPageState;
  _SettingPageState._() : super._();

  @override
  User get initUser;
  @override
  FormModel get username;
  @override
  @JsonKey(ignore: true)
  _$$_SettingPageStateCopyWith<_$_SettingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
