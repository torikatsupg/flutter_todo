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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<Data, Err> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data value) ok,
    required TResult Function(Err value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Data value)? ok,
    TResult Function(Err value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data value)? ok,
    TResult Function(Err value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Data, Err> value) ok,
    required TResult Function(Error<Data, Err> value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Data, Err> value)? ok,
    TResult Function(Error<Data, Err> value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Data, Err> value)? ok,
    TResult Function(Error<Data, Err> value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<Data, Err, $Res> {
  factory $ResultCopyWith(
          Result<Data, Err> value, $Res Function(Result<Data, Err>) then) =
      _$ResultCopyWithImpl<Data, Err, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<Data, Err, $Res>
    implements $ResultCopyWith<Data, Err, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<Data, Err> _value;
  // ignore: unused_field
  final $Res Function(Result<Data, Err>) _then;
}

/// @nodoc
abstract class _$$OkCopyWith<Data, Err, $Res> {
  factory _$$OkCopyWith(
          _$Ok<Data, Err> value, $Res Function(_$Ok<Data, Err>) then) =
      __$$OkCopyWithImpl<Data, Err, $Res>;
  $Res call({Data value});
}

/// @nodoc
class __$$OkCopyWithImpl<Data, Err, $Res>
    extends _$ResultCopyWithImpl<Data, Err, $Res>
    implements _$$OkCopyWith<Data, Err, $Res> {
  __$$OkCopyWithImpl(
      _$Ok<Data, Err> _value, $Res Function(_$Ok<Data, Err>) _then)
      : super(_value, (v) => _then(v as _$Ok<Data, Err>));

  @override
  _$Ok<Data, Err> get _value => super._value as _$Ok<Data, Err>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$Ok<Data, Err>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc

class _$Ok<Data, Err> extends Ok<Data, Err> {
  _$Ok(this.value) : super._();

  @override
  final Data value;

  @override
  String toString() {
    return 'Result<$Data, $Err>.ok(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ok<Data, Err> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$OkCopyWith<Data, Err, _$Ok<Data, Err>> get copyWith =>
      __$$OkCopyWithImpl<Data, Err, _$Ok<Data, Err>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data value) ok,
    required TResult Function(Err value) err,
  }) {
    return ok(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Data value)? ok,
    TResult Function(Err value)? err,
  }) {
    return ok?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data value)? ok,
    TResult Function(Err value)? err,
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
    required TResult Function(Ok<Data, Err> value) ok,
    required TResult Function(Error<Data, Err> value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Data, Err> value)? ok,
    TResult Function(Error<Data, Err> value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Data, Err> value)? ok,
    TResult Function(Error<Data, Err> value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class Ok<Data, Err> extends Result<Data, Err> {
  factory Ok(final Data value) = _$Ok<Data, Err>;
  Ok._() : super._();

  Data get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$OkCopyWith<Data, Err, _$Ok<Data, Err>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<Data, Err, $Res> {
  factory _$$ErrorCopyWith(
          _$Error<Data, Err> value, $Res Function(_$Error<Data, Err>) then) =
      __$$ErrorCopyWithImpl<Data, Err, $Res>;
  $Res call({Err value});
}

/// @nodoc
class __$$ErrorCopyWithImpl<Data, Err, $Res>
    extends _$ResultCopyWithImpl<Data, Err, $Res>
    implements _$$ErrorCopyWith<Data, Err, $Res> {
  __$$ErrorCopyWithImpl(
      _$Error<Data, Err> _value, $Res Function(_$Error<Data, Err>) _then)
      : super(_value, (v) => _then(v as _$Error<Data, Err>));

  @override
  _$Error<Data, Err> get _value => super._value as _$Error<Data, Err>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$Error<Data, Err>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Err,
    ));
  }
}

/// @nodoc

class _$Error<Data, Err> extends Error<Data, Err> {
  _$Error(this.value) : super._();

  @override
  final Err value;

  @override
  String toString() {
    return 'Result<$Data, $Err>.err(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error<Data, Err> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<Data, Err, _$Error<Data, Err>> get copyWith =>
      __$$ErrorCopyWithImpl<Data, Err, _$Error<Data, Err>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data value) ok,
    required TResult Function(Err value) err,
  }) {
    return err(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Data value)? ok,
    TResult Function(Err value)? err,
  }) {
    return err?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data value)? ok,
    TResult Function(Err value)? err,
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
    required TResult Function(Ok<Data, Err> value) ok,
    required TResult Function(Error<Data, Err> value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Data, Err> value)? ok,
    TResult Function(Error<Data, Err> value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Data, Err> value)? ok,
    TResult Function(Error<Data, Err> value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class Error<Data, Err> extends Result<Data, Err> {
  factory Error(final Err value) = _$Error<Data, Err>;
  Error._() : super._();

  Err get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<Data, Err, _$Error<Data, Err>> get copyWith =>
      throw _privateConstructorUsedError;
}
