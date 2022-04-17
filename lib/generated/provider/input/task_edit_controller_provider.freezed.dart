// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../provider/input/task_edit_controller_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$_TaskEditStateTearOff {
  const _$_TaskEditStateTearOff();

  __TaskEditState call({required Task initTask, required FormModel name}) {
    return __TaskEditState(
      initTask: initTask,
      name: name,
    );
  }
}

/// @nodoc
const _$TaskEditState = _$_TaskEditStateTearOff();

/// @nodoc
mixin _$_TaskEditState {
  Task get initTask => throw _privateConstructorUsedError;
  FormModel get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$TaskEditStateCopyWith<_TaskEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TaskEditStateCopyWith<$Res> {
  factory _$TaskEditStateCopyWith(
          _TaskEditState value, $Res Function(_TaskEditState) then) =
      __$TaskEditStateCopyWithImpl<$Res>;
  $Res call({Task initTask, FormModel name});

  $TaskCopyWith<$Res> get initTask;
  $FormModelCopyWith<$Res> get name;
}

/// @nodoc
class __$TaskEditStateCopyWithImpl<$Res>
    implements _$TaskEditStateCopyWith<$Res> {
  __$TaskEditStateCopyWithImpl(this._value, this._then);

  final _TaskEditState _value;
  // ignore: unused_field
  final $Res Function(_TaskEditState) _then;

  @override
  $Res call({
    Object? initTask = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      initTask: initTask == freezed
          ? _value.initTask
          : initTask // ignore: cast_nullable_to_non_nullable
              as Task,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  @override
  $TaskCopyWith<$Res> get initTask {
    return $TaskCopyWith<$Res>(_value.initTask, (value) {
      return _then(_value.copyWith(initTask: value));
    });
  }

  @override
  $FormModelCopyWith<$Res> get name {
    return $FormModelCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value));
    });
  }
}

/// @nodoc
abstract class _$_TaskEditStateCopyWith<$Res>
    implements _$TaskEditStateCopyWith<$Res> {
  factory _$_TaskEditStateCopyWith(
          __TaskEditState value, $Res Function(__TaskEditState) then) =
      __$_TaskEditStateCopyWithImpl<$Res>;
  @override
  $Res call({Task initTask, FormModel name});

  @override
  $TaskCopyWith<$Res> get initTask;
  @override
  $FormModelCopyWith<$Res> get name;
}

/// @nodoc
class __$_TaskEditStateCopyWithImpl<$Res>
    extends __$TaskEditStateCopyWithImpl<$Res>
    implements _$_TaskEditStateCopyWith<$Res> {
  __$_TaskEditStateCopyWithImpl(
      __TaskEditState _value, $Res Function(__TaskEditState) _then)
      : super(_value, (v) => _then(v as __TaskEditState));

  @override
  __TaskEditState get _value => super._value as __TaskEditState;

  @override
  $Res call({
    Object? initTask = freezed,
    Object? name = freezed,
  }) {
    return _then(__TaskEditState(
      initTask: initTask == freezed
          ? _value.initTask
          : initTask // ignore: cast_nullable_to_non_nullable
              as Task,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }
}

/// @nodoc

class _$__TaskEditState extends __TaskEditState {
  _$__TaskEditState({required this.initTask, required this.name}) : super._();

  @override
  final Task initTask;
  @override
  final FormModel name;

  @override
  String toString() {
    return '_TaskEditState(initTask: $initTask, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is __TaskEditState &&
            const DeepCollectionEquality().equals(other.initTask, initTask) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initTask),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$_TaskEditStateCopyWith<__TaskEditState> get copyWith =>
      __$_TaskEditStateCopyWithImpl<__TaskEditState>(this, _$identity);
}

abstract class __TaskEditState extends _TaskEditState {
  factory __TaskEditState({required Task initTask, required FormModel name}) =
      _$__TaskEditState;
  __TaskEditState._() : super._();

  @override
  Task get initTask;
  @override
  FormModel get name;
  @override
  @JsonKey(ignore: true)
  _$_TaskEditStateCopyWith<__TaskEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
