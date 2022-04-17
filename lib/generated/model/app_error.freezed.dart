// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppErrorTearOff {
  const _$AppErrorTearOff();

  Unknown unknown() {
    return Unknown();
  }

  Unauthorized unauthorized() {
    return Unauthorized();
  }

  IlligalUrl illigalUrl() {
    return IlligalUrl();
  }
}

/// @nodoc
const $AppError = _$AppErrorTearOff();

/// @nodoc
mixin _$AppError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() unauthorized,
    required TResult Function() illigalUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(IlligalUrl value) illigalUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res> implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  final AppError _value;
  // ignore: unused_field
  final $Res Function(AppError) _then;
}

/// @nodoc
abstract class $UnknownCopyWith<$Res> {
  factory $UnknownCopyWith(Unknown value, $Res Function(Unknown) then) =
      _$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnknownCopyWithImpl<$Res> extends _$AppErrorCopyWithImpl<$Res>
    implements $UnknownCopyWith<$Res> {
  _$UnknownCopyWithImpl(Unknown _value, $Res Function(Unknown) _then)
      : super(_value, (v) => _then(v as Unknown));

  @override
  Unknown get _value => super._value as Unknown;
}

/// @nodoc

class _$Unknown extends Unknown {
  _$Unknown() : super._();

  @override
  String toString() {
    return 'AppError.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() unauthorized,
    required TResult Function() illigalUrl,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(IlligalUrl value) illigalUrl,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown extends AppError {
  factory Unknown() = _$Unknown;
  Unknown._() : super._();
}

/// @nodoc
abstract class $UnauthorizedCopyWith<$Res> {
  factory $UnauthorizedCopyWith(
          Unauthorized value, $Res Function(Unauthorized) then) =
      _$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthorizedCopyWithImpl<$Res> extends _$AppErrorCopyWithImpl<$Res>
    implements $UnauthorizedCopyWith<$Res> {
  _$UnauthorizedCopyWithImpl(
      Unauthorized _value, $Res Function(Unauthorized) _then)
      : super(_value, (v) => _then(v as Unauthorized));

  @override
  Unauthorized get _value => super._value as Unauthorized;
}

/// @nodoc

class _$Unauthorized extends Unauthorized {
  _$Unauthorized() : super._();

  @override
  String toString() {
    return 'AppError.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() unauthorized,
    required TResult Function() illigalUrl,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(IlligalUrl value) illigalUrl,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized extends AppError {
  factory Unauthorized() = _$Unauthorized;
  Unauthorized._() : super._();
}

/// @nodoc
abstract class $IlligalUrlCopyWith<$Res> {
  factory $IlligalUrlCopyWith(
          IlligalUrl value, $Res Function(IlligalUrl) then) =
      _$IlligalUrlCopyWithImpl<$Res>;
}

/// @nodoc
class _$IlligalUrlCopyWithImpl<$Res> extends _$AppErrorCopyWithImpl<$Res>
    implements $IlligalUrlCopyWith<$Res> {
  _$IlligalUrlCopyWithImpl(IlligalUrl _value, $Res Function(IlligalUrl) _then)
      : super(_value, (v) => _then(v as IlligalUrl));

  @override
  IlligalUrl get _value => super._value as IlligalUrl;
}

/// @nodoc

class _$IlligalUrl extends IlligalUrl {
  _$IlligalUrl() : super._();

  @override
  String toString() {
    return 'AppError.illigalUrl()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IlligalUrl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() unauthorized,
    required TResult Function() illigalUrl,
  }) {
    return illigalUrl();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
  }) {
    return illigalUrl?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? unauthorized,
    TResult Function()? illigalUrl,
    required TResult orElse(),
  }) {
    if (illigalUrl != null) {
      return illigalUrl();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(IlligalUrl value) illigalUrl,
  }) {
    return illigalUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
  }) {
    return illigalUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(IlligalUrl value)? illigalUrl,
    required TResult orElse(),
  }) {
    if (illigalUrl != null) {
      return illigalUrl(this);
    }
    return orElse();
  }
}

abstract class IlligalUrl extends AppError {
  factory IlligalUrl() = _$IlligalUrl;
  IlligalUrl._() : super._();
}
