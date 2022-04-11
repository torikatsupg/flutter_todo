// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  Ok<Data, Error> ok<Data, Error>([Data? value]) {
    return Ok<Data, Error>(
      value,
    );
  }

  Err<Data, Error> err<Data, Error>(Error value) {
    return Err<Data, Error>(
      value,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<Data, Error> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data? value) ok,
    required TResult Function(Error value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Data? value)? ok,
    TResult Function(Error value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data? value)? ok,
    TResult Function(Error value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Data, Error> value) ok,
    required TResult Function(Err<Data, Error> value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Data, Error> value)? ok,
    TResult Function(Err<Data, Error> value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Data, Error> value)? ok,
    TResult Function(Err<Data, Error> value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<Data, Error, $Res> {
  factory $ResultCopyWith(
          Result<Data, Error> value, $Res Function(Result<Data, Error>) then) =
      _$ResultCopyWithImpl<Data, Error, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<Data, Error, $Res>
    implements $ResultCopyWith<Data, Error, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<Data, Error> _value;
  // ignore: unused_field
  final $Res Function(Result<Data, Error>) _then;
}

/// @nodoc
abstract class $OkCopyWith<Data, Error, $Res> {
  factory $OkCopyWith(
          Ok<Data, Error> value, $Res Function(Ok<Data, Error>) then) =
      _$OkCopyWithImpl<Data, Error, $Res>;
  $Res call({Data? value});
}

/// @nodoc
class _$OkCopyWithImpl<Data, Error, $Res>
    extends _$ResultCopyWithImpl<Data, Error, $Res>
    implements $OkCopyWith<Data, Error, $Res> {
  _$OkCopyWithImpl(Ok<Data, Error> _value, $Res Function(Ok<Data, Error>) _then)
      : super(_value, (v) => _then(v as Ok<Data, Error>));

  @override
  Ok<Data, Error> get _value => super._value as Ok<Data, Error>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Ok<Data, Error>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc

class _$Ok<Data, Error> extends Ok<Data, Error> {
  _$Ok([this.value]) : super._();

  @override
  final Data? value;

  @override
  String toString() {
    return 'Result<$Data, $Error>.ok(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ok<Data, Error> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $OkCopyWith<Data, Error, Ok<Data, Error>> get copyWith =>
      _$OkCopyWithImpl<Data, Error, Ok<Data, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data? value) ok,
    required TResult Function(Error value) err,
  }) {
    return ok(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Data? value)? ok,
    TResult Function(Error value)? err,
  }) {
    return ok?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data? value)? ok,
    TResult Function(Error value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Data, Error> value) ok,
    required TResult Function(Err<Data, Error> value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Data, Error> value)? ok,
    TResult Function(Err<Data, Error> value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Data, Error> value)? ok,
    TResult Function(Err<Data, Error> value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class Ok<Data, Error> extends Result<Data, Error> {
  factory Ok([Data? value]) = _$Ok<Data, Error>;
  Ok._() : super._();

  Data? get value;
  @JsonKey(ignore: true)
  $OkCopyWith<Data, Error, Ok<Data, Error>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrCopyWith<Data, Error, $Res> {
  factory $ErrCopyWith(
          Err<Data, Error> value, $Res Function(Err<Data, Error>) then) =
      _$ErrCopyWithImpl<Data, Error, $Res>;
  $Res call({Error value});
}

/// @nodoc
class _$ErrCopyWithImpl<Data, Error, $Res>
    extends _$ResultCopyWithImpl<Data, Error, $Res>
    implements $ErrCopyWith<Data, Error, $Res> {
  _$ErrCopyWithImpl(
      Err<Data, Error> _value, $Res Function(Err<Data, Error>) _then)
      : super(_value, (v) => _then(v as Err<Data, Error>));

  @override
  Err<Data, Error> get _value => super._value as Err<Data, Error>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Err<Data, Error>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc

class _$Err<Data, Error> extends Err<Data, Error> {
  _$Err(this.value) : super._();

  @override
  final Error value;

  @override
  String toString() {
    return 'Result<$Data, $Error>.err(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Err<Data, Error> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $ErrCopyWith<Data, Error, Err<Data, Error>> get copyWith =>
      _$ErrCopyWithImpl<Data, Error, Err<Data, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data? value) ok,
    required TResult Function(Error value) err,
  }) {
    return err(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Data? value)? ok,
    TResult Function(Error value)? err,
  }) {
    return err?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data? value)? ok,
    TResult Function(Error value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Data, Error> value) ok,
    required TResult Function(Err<Data, Error> value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Data, Error> value)? ok,
    TResult Function(Err<Data, Error> value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Data, Error> value)? ok,
    TResult Function(Err<Data, Error> value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class Err<Data, Error> extends Result<Data, Error> {
  factory Err(Error value) = _$Err<Data, Error>;
  Err._() : super._();

  Error get value;
  @JsonKey(ignore: true)
  $ErrCopyWith<Data, Error, Err<Data, Error>> get copyWith =>
      throw _privateConstructorUsedError;
}
