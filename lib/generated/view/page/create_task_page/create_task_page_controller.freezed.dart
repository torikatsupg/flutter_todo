// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../view/page/create_task_page/create_task_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$_CreateTaskState {
  FormModel get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$CreateTaskStateCopyWith<_CreateTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CreateTaskStateCopyWith<$Res> {
  factory _$CreateTaskStateCopyWith(
          _CreateTaskState value, $Res Function(_CreateTaskState) then) =
      __$CreateTaskStateCopyWithImpl<$Res>;
  $Res call({FormModel name});

  $FormModelCopyWith<$Res> get name;
}

/// @nodoc
class __$CreateTaskStateCopyWithImpl<$Res>
    implements _$CreateTaskStateCopyWith<$Res> {
  __$CreateTaskStateCopyWithImpl(this._value, this._then);

  final _CreateTaskState _value;
  // ignore: unused_field
  final $Res Function(_CreateTaskState) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }

  @override
  $FormModelCopyWith<$Res> get name {
    return $FormModelCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value));
    });
  }
}

/// @nodoc
abstract class _$$__CreateTaskControllerCopyWith<$Res>
    implements _$CreateTaskStateCopyWith<$Res> {
  factory _$$__CreateTaskControllerCopyWith(_$__CreateTaskController value,
          $Res Function(_$__CreateTaskController) then) =
      __$$__CreateTaskControllerCopyWithImpl<$Res>;
  @override
  $Res call({FormModel name});

  @override
  $FormModelCopyWith<$Res> get name;
}

/// @nodoc
class __$$__CreateTaskControllerCopyWithImpl<$Res>
    extends __$CreateTaskStateCopyWithImpl<$Res>
    implements _$$__CreateTaskControllerCopyWith<$Res> {
  __$$__CreateTaskControllerCopyWithImpl(_$__CreateTaskController _value,
      $Res Function(_$__CreateTaskController) _then)
      : super(_value, (v) => _then(v as _$__CreateTaskController));

  @override
  _$__CreateTaskController get _value =>
      super._value as _$__CreateTaskController;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$__CreateTaskController(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FormModel,
    ));
  }
}

/// @nodoc

class _$__CreateTaskController extends __CreateTaskController {
  _$__CreateTaskController({required this.name}) : super._();

  @override
  final FormModel name;

  @override
  String toString() {
    return '_CreateTaskState(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__CreateTaskController &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$__CreateTaskControllerCopyWith<_$__CreateTaskController> get copyWith =>
      __$$__CreateTaskControllerCopyWithImpl<_$__CreateTaskController>(
          this, _$identity);
}

abstract class __CreateTaskController extends _CreateTaskState {
  factory __CreateTaskController({required final FormModel name}) =
      _$__CreateTaskController;
  __CreateTaskController._() : super._();

  @override
  FormModel get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$__CreateTaskControllerCopyWith<_$__CreateTaskController> get copyWith =>
      throw _privateConstructorUsedError;
}
