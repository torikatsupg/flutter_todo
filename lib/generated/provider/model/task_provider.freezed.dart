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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskArg {
  String get uid => throw _privateConstructorUsedError;
  TaskId get taskId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskArgCopyWith<TaskArg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskArgCopyWith<$Res> {
  factory $TaskArgCopyWith(TaskArg value, $Res Function(TaskArg) then) =
      _$TaskArgCopyWithImpl<$Res>;
  $Res call({String uid, TaskId taskId});

  $TaskIdCopyWith<$Res> get taskId;
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
    Object? taskId = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskId,
    ));
  }

  @override
  $TaskIdCopyWith<$Res> get taskId {
    return $TaskIdCopyWith<$Res>(_value.taskId, (value) {
      return _then(_value.copyWith(taskId: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskArgCopyWith<$Res> implements $TaskArgCopyWith<$Res> {
  factory _$$_TaskArgCopyWith(
          _$_TaskArg value, $Res Function(_$_TaskArg) then) =
      __$$_TaskArgCopyWithImpl<$Res>;
  @override
  $Res call({String uid, TaskId taskId});

  @override
  $TaskIdCopyWith<$Res> get taskId;
}

/// @nodoc
class __$$_TaskArgCopyWithImpl<$Res> extends _$TaskArgCopyWithImpl<$Res>
    implements _$$_TaskArgCopyWith<$Res> {
  __$$_TaskArgCopyWithImpl(_$_TaskArg _value, $Res Function(_$_TaskArg) _then)
      : super(_value, (v) => _then(v as _$_TaskArg));

  @override
  _$_TaskArg get _value => super._value as _$_TaskArg;

  @override
  $Res call({
    Object? uid = freezed,
    Object? taskId = freezed,
  }) {
    return _then(_$_TaskArg(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskId,
    ));
  }
}

/// @nodoc

class _$_TaskArg extends _TaskArg {
  _$_TaskArg({required this.uid, required this.taskId}) : super._();

  @override
  final String uid;
  @override
  final TaskId taskId;

  @override
  String toString() {
    return 'TaskArg(uid: $uid, taskId: $taskId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskArg &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.taskId, taskId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(taskId));

  @JsonKey(ignore: true)
  @override
  _$$_TaskArgCopyWith<_$_TaskArg> get copyWith =>
      __$$_TaskArgCopyWithImpl<_$_TaskArg>(this, _$identity);
}

abstract class _TaskArg extends TaskArg {
  factory _TaskArg({required final String uid, required final TaskId taskId}) =
      _$_TaskArg;
  _TaskArg._() : super._();

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  TaskId get taskId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TaskArgCopyWith<_$_TaskArg> get copyWith =>
      throw _privateConstructorUsedError;
}
