// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  TaskId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call({TaskId id, String name, DateTime createdAt, bool isDone});

  $TaskIdCopyWith<$Res> get id;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $TaskIdCopyWith<$Res> get id {
    return $TaskIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call({TaskId id, String name, DateTime createdAt, bool isDone});

  @override
  $TaskIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_$_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Task extends _Task {
  _$_Task(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.isDone})
      : super._();

  @override
  final TaskId id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final bool isDone;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, createdAt: $createdAt, isDone: $isDone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.isDone, isDone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isDone));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task extends Task {
  factory _Task(
      {required final TaskId id,
      required final String name,
      required final DateTime createdAt,
      required final bool isDone}) = _$_Task;
  _Task._() : super._();

  @override
  TaskId get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  bool get isDone => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskIdCopyWith<TaskId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskIdCopyWith<$Res> {
  factory $TaskIdCopyWith(TaskId value, $Res Function(TaskId) then) =
      _$TaskIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$TaskIdCopyWithImpl<$Res> implements $TaskIdCopyWith<$Res> {
  _$TaskIdCopyWithImpl(this._value, this._then);

  final TaskId _value;
  // ignore: unused_field
  final $Res Function(TaskId) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskIdCopyWith<$Res> implements $TaskIdCopyWith<$Res> {
  factory _$$_TaskIdCopyWith(_$_TaskId value, $Res Function(_$_TaskId) then) =
      __$$_TaskIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$_TaskIdCopyWithImpl<$Res> extends _$TaskIdCopyWithImpl<$Res>
    implements _$$_TaskIdCopyWith<$Res> {
  __$$_TaskIdCopyWithImpl(_$_TaskId _value, $Res Function(_$_TaskId) _then)
      : super(_value, (v) => _then(v as _$_TaskId));

  @override
  _$_TaskId get _value => super._value as _$_TaskId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_TaskId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TaskId extends _TaskId {
  _$_TaskId(this.value) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'TaskId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskId &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_TaskIdCopyWith<_$_TaskId> get copyWith =>
      __$$_TaskIdCopyWithImpl<_$_TaskId>(this, _$identity);
}

abstract class _TaskId extends TaskId {
  factory _TaskId(final String value) = _$_TaskId;
  _TaskId._() : super._();

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TaskIdCopyWith<_$_TaskId> get copyWith =>
      throw _privateConstructorUsedError;
}
