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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoTaskTearOff {
  const _$TodoTaskTearOff();

  _TodoTask call({required String id, required String name}) {
    return _TodoTask(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
const $TodoTask = _$TodoTaskTearOff();

/// @nodoc
mixin _$TodoTask {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoTaskCopyWith<TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoTaskCopyWith<$Res> {
  factory $TodoTaskCopyWith(TodoTask value, $Res Function(TodoTask) then) =
      _$TodoTaskCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$TodoTaskCopyWithImpl<$Res> implements $TodoTaskCopyWith<$Res> {
  _$TodoTaskCopyWithImpl(this._value, this._then);

  final TodoTask _value;
  // ignore: unused_field
  final $Res Function(TodoTask) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TodoTaskCopyWith<$Res> implements $TodoTaskCopyWith<$Res> {
  factory _$TodoTaskCopyWith(_TodoTask value, $Res Function(_TodoTask) then) =
      __$TodoTaskCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$TodoTaskCopyWithImpl<$Res> extends _$TodoTaskCopyWithImpl<$Res>
    implements _$TodoTaskCopyWith<$Res> {
  __$TodoTaskCopyWithImpl(_TodoTask _value, $Res Function(_TodoTask) _then)
      : super(_value, (v) => _then(v as _TodoTask));

  @override
  _TodoTask get _value => super._value as _TodoTask;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_TodoTask(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Implements<Task>()
class _$_TodoTask extends _TodoTask {
  _$_TodoTask({required this.id, required this.name}) : super._();

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'TodoTask(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoTask &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$TodoTaskCopyWith<_TodoTask> get copyWith =>
      __$TodoTaskCopyWithImpl<_TodoTask>(this, _$identity);
}

abstract class _TodoTask extends TodoTask implements Task {
  factory _TodoTask({required String id, required String name}) = _$_TodoTask;
  _TodoTask._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$TodoTaskCopyWith<_TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DoneTaskTearOff {
  const _$DoneTaskTearOff();

  _DoneTask call({required String id, required String name}) {
    return _DoneTask(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
const $DoneTask = _$DoneTaskTearOff();

/// @nodoc
mixin _$DoneTask {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoneTaskCopyWith<DoneTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoneTaskCopyWith<$Res> {
  factory $DoneTaskCopyWith(DoneTask value, $Res Function(DoneTask) then) =
      _$DoneTaskCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$DoneTaskCopyWithImpl<$Res> implements $DoneTaskCopyWith<$Res> {
  _$DoneTaskCopyWithImpl(this._value, this._then);

  final DoneTask _value;
  // ignore: unused_field
  final $Res Function(DoneTask) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DoneTaskCopyWith<$Res> implements $DoneTaskCopyWith<$Res> {
  factory _$DoneTaskCopyWith(_DoneTask value, $Res Function(_DoneTask) then) =
      __$DoneTaskCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$DoneTaskCopyWithImpl<$Res> extends _$DoneTaskCopyWithImpl<$Res>
    implements _$DoneTaskCopyWith<$Res> {
  __$DoneTaskCopyWithImpl(_DoneTask _value, $Res Function(_DoneTask) _then)
      : super(_value, (v) => _then(v as _DoneTask));

  @override
  _DoneTask get _value => super._value as _DoneTask;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_DoneTask(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Implements<Task>()
class _$_DoneTask extends _DoneTask {
  _$_DoneTask({required this.id, required this.name}) : super._();

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'DoneTask(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DoneTask &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$DoneTaskCopyWith<_DoneTask> get copyWith =>
      __$DoneTaskCopyWithImpl<_DoneTask>(this, _$identity);
}

abstract class _DoneTask extends DoneTask implements Task {
  factory _DoneTask({required String id, required String name}) = _$_DoneTask;
  _DoneTask._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$DoneTaskCopyWith<_DoneTask> get copyWith =>
      throw _privateConstructorUsedError;
}
