// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../provider/model/task_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TasksArgTearOff {
  const _$TasksArgTearOff();

  _TasksArg call({required String uid, CursorImpl? cursor}) {
    return _TasksArg(
      uid: uid,
      cursor: cursor,
    );
  }
}

/// @nodoc
const $TasksArg = _$TasksArgTearOff();

/// @nodoc
mixin _$TasksArg {
  String get uid => throw _privateConstructorUsedError;
  CursorImpl? get cursor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksArgCopyWith<TasksArg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksArgCopyWith<$Res> {
  factory $TasksArgCopyWith(TasksArg value, $Res Function(TasksArg) then) =
      _$TasksArgCopyWithImpl<$Res>;
  $Res call({String uid, CursorImpl? cursor});
}

/// @nodoc
class _$TasksArgCopyWithImpl<$Res> implements $TasksArgCopyWith<$Res> {
  _$TasksArgCopyWithImpl(this._value, this._then);

  final TasksArg _value;
  // ignore: unused_field
  final $Res Function(TasksArg) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? cursor = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as CursorImpl?,
    ));
  }
}

/// @nodoc
abstract class _$TasksArgCopyWith<$Res> implements $TasksArgCopyWith<$Res> {
  factory _$TasksArgCopyWith(_TasksArg value, $Res Function(_TasksArg) then) =
      __$TasksArgCopyWithImpl<$Res>;
  @override
  $Res call({String uid, CursorImpl? cursor});
}

/// @nodoc
class __$TasksArgCopyWithImpl<$Res> extends _$TasksArgCopyWithImpl<$Res>
    implements _$TasksArgCopyWith<$Res> {
  __$TasksArgCopyWithImpl(_TasksArg _value, $Res Function(_TasksArg) _then)
      : super(_value, (v) => _then(v as _TasksArg));

  @override
  _TasksArg get _value => super._value as _TasksArg;

  @override
  $Res call({
    Object? uid = freezed,
    Object? cursor = freezed,
  }) {
    return _then(_TasksArg(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as CursorImpl?,
    ));
  }
}

/// @nodoc

class _$_TasksArg extends _TasksArg {
  _$_TasksArg({required this.uid, this.cursor}) : super._();

  @override
  final String uid;
  @override
  final CursorImpl? cursor;

  @override
  String toString() {
    return 'TasksArg(uid: $uid, cursor: $cursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TasksArg &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.cursor, cursor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(cursor));

  @JsonKey(ignore: true)
  @override
  _$TasksArgCopyWith<_TasksArg> get copyWith =>
      __$TasksArgCopyWithImpl<_TasksArg>(this, _$identity);
}

abstract class _TasksArg extends TasksArg {
  factory _TasksArg({required String uid, CursorImpl? cursor}) = _$_TasksArg;
  _TasksArg._() : super._();

  @override
  String get uid;
  @override
  CursorImpl? get cursor;
  @override
  @JsonKey(ignore: true)
  _$TasksArgCopyWith<_TasksArg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TaskArgTearOff {
  const _$TaskArgTearOff();

  _TaskArg call({required String uid, required String id}) {
    return _TaskArg(
      uid: uid,
      id: id,
    );
  }
}

/// @nodoc
const $TaskArg = _$TaskArgTearOff();

/// @nodoc
mixin _$TaskArg {
  String get uid => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskArgCopyWith<TaskArg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskArgCopyWith<$Res> {
  factory $TaskArgCopyWith(TaskArg value, $Res Function(TaskArg) then) =
      _$TaskArgCopyWithImpl<$Res>;
  $Res call({String uid, String id});
}

/// @nodoc
class _$TaskArgCopyWithImpl<$Res> implements $TaskArgCopyWith<$Res> {
  _$TaskArgCopyWithImpl(this._value, this._then);

  final TaskArg _value;
  // ignore: unused_field
  final $Res Function(TaskArg) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TaskArgCopyWith<$Res> implements $TaskArgCopyWith<$Res> {
  factory _$TaskArgCopyWith(_TaskArg value, $Res Function(_TaskArg) then) =
      __$TaskArgCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String id});
}

/// @nodoc
class __$TaskArgCopyWithImpl<$Res> extends _$TaskArgCopyWithImpl<$Res>
    implements _$TaskArgCopyWith<$Res> {
  __$TaskArgCopyWithImpl(_TaskArg _value, $Res Function(_TaskArg) _then)
      : super(_value, (v) => _then(v as _TaskArg));

  @override
  _TaskArg get _value => super._value as _TaskArg;

  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
  }) {
    return _then(_TaskArg(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TaskArg extends _TaskArg {
  _$_TaskArg({required this.uid, required this.id}) : super._();

  @override
  final String uid;
  @override
  final String id;

  @override
  String toString() {
    return 'TaskArg(uid: $uid, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskArg &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$TaskArgCopyWith<_TaskArg> get copyWith =>
      __$TaskArgCopyWithImpl<_TaskArg>(this, _$identity);
}

abstract class _TaskArg extends TaskArg {
  factory _TaskArg({required String uid, required String id}) = _$_TaskArg;
  _TaskArg._() : super._();

  @override
  String get uid;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$TaskArgCopyWith<_TaskArg> get copyWith =>
      throw _privateConstructorUsedError;
}
