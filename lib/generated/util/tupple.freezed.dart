// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../util/tupple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$T2<V1, V2> {
  V1 get v1 => throw _privateConstructorUsedError;
  V2 get v2 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $T2CopyWith<V1, V2, T2<V1, V2>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $T2CopyWith<V1, V2, $Res> {
  factory $T2CopyWith(T2<V1, V2> value, $Res Function(T2<V1, V2>) then) =
      _$T2CopyWithImpl<V1, V2, $Res>;
  $Res call({V1 v1, V2 v2});
}

/// @nodoc
class _$T2CopyWithImpl<V1, V2, $Res> implements $T2CopyWith<V1, V2, $Res> {
  _$T2CopyWithImpl(this._value, this._then);

  final T2<V1, V2> _value;
  // ignore: unused_field
  final $Res Function(T2<V1, V2>) _then;

  @override
  $Res call({
    Object? v1 = freezed,
    Object? v2 = freezed,
  }) {
    return _then(_value.copyWith(
      v1: v1 == freezed
          ? _value.v1
          : v1 // ignore: cast_nullable_to_non_nullable
              as V1,
      v2: v2 == freezed
          ? _value.v2
          : v2 // ignore: cast_nullable_to_non_nullable
              as V2,
    ));
  }
}

/// @nodoc
abstract class _$$_T2CopyWith<V1, V2, $Res>
    implements $T2CopyWith<V1, V2, $Res> {
  factory _$$_T2CopyWith(
          _$_T2<V1, V2> value, $Res Function(_$_T2<V1, V2>) then) =
      __$$_T2CopyWithImpl<V1, V2, $Res>;
  @override
  $Res call({V1 v1, V2 v2});
}

/// @nodoc
class __$$_T2CopyWithImpl<V1, V2, $Res> extends _$T2CopyWithImpl<V1, V2, $Res>
    implements _$$_T2CopyWith<V1, V2, $Res> {
  __$$_T2CopyWithImpl(_$_T2<V1, V2> _value, $Res Function(_$_T2<V1, V2>) _then)
      : super(_value, (v) => _then(v as _$_T2<V1, V2>));

  @override
  _$_T2<V1, V2> get _value => super._value as _$_T2<V1, V2>;

  @override
  $Res call({
    Object? v1 = freezed,
    Object? v2 = freezed,
  }) {
    return _then(_$_T2<V1, V2>(
      v1 == freezed
          ? _value.v1
          : v1 // ignore: cast_nullable_to_non_nullable
              as V1,
      v2 == freezed
          ? _value.v2
          : v2 // ignore: cast_nullable_to_non_nullable
              as V2,
    ));
  }
}

/// @nodoc

class _$_T2<V1, V2> extends _T2<V1, V2> {
  _$_T2(this.v1, this.v2) : super._();

  @override
  final V1 v1;
  @override
  final V2 v2;

  @override
  String toString() {
    return 'T2<$V1, $V2>(v1: $v1, v2: $v2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_T2<V1, V2> &&
            const DeepCollectionEquality().equals(other.v1, v1) &&
            const DeepCollectionEquality().equals(other.v2, v2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(v1),
      const DeepCollectionEquality().hash(v2));

  @JsonKey(ignore: true)
  @override
  _$$_T2CopyWith<V1, V2, _$_T2<V1, V2>> get copyWith =>
      __$$_T2CopyWithImpl<V1, V2, _$_T2<V1, V2>>(this, _$identity);
}

abstract class _T2<V1, V2> extends T2<V1, V2> {
  factory _T2(final V1 v1, final V2 v2) = _$_T2<V1, V2>;
  _T2._() : super._();

  @override
  V1 get v1;
  @override
  V2 get v2;
  @override
  @JsonKey(ignore: true)
  _$$_T2CopyWith<V1, V2, _$_T2<V1, V2>> get copyWith =>
      throw _privateConstructorUsedError;
}
