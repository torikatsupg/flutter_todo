// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../model/form_model/form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FormModelTearOff {
  const _$FormModelTearOff();

  _FormModel call(
      {required Validator validator,
      required TextEditingController controller,
      required FocusNode focusNode,
      bool hasEdit = false}) {
    return _FormModel(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      hasEdit: hasEdit,
    );
  }
}

/// @nodoc
const $FormModel = _$FormModelTearOff();

/// @nodoc
mixin _$FormModel {
  Validator get validator => throw _privateConstructorUsedError;
  TextEditingController get controller => throw _privateConstructorUsedError;
  FocusNode get focusNode => throw _privateConstructorUsedError;
  bool get hasEdit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormModelCopyWith<FormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormModelCopyWith<$Res> {
  factory $FormModelCopyWith(FormModel value, $Res Function(FormModel) then) =
      _$FormModelCopyWithImpl<$Res>;
  $Res call(
      {Validator validator,
      TextEditingController controller,
      FocusNode focusNode,
      bool hasEdit});
}

/// @nodoc
class _$FormModelCopyWithImpl<$Res> implements $FormModelCopyWith<$Res> {
  _$FormModelCopyWithImpl(this._value, this._then);

  final FormModel _value;
  // ignore: unused_field
  final $Res Function(FormModel) _then;

  @override
  $Res call({
    Object? validator = freezed,
    Object? controller = freezed,
    Object? focusNode = freezed,
    Object? hasEdit = freezed,
  }) {
    return _then(_value.copyWith(
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      focusNode: focusNode == freezed
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      hasEdit: hasEdit == freezed
          ? _value.hasEdit
          : hasEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FormModelCopyWith<$Res> implements $FormModelCopyWith<$Res> {
  factory _$FormModelCopyWith(
          _FormModel value, $Res Function(_FormModel) then) =
      __$FormModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {Validator validator,
      TextEditingController controller,
      FocusNode focusNode,
      bool hasEdit});
}

/// @nodoc
class __$FormModelCopyWithImpl<$Res> extends _$FormModelCopyWithImpl<$Res>
    implements _$FormModelCopyWith<$Res> {
  __$FormModelCopyWithImpl(_FormModel _value, $Res Function(_FormModel) _then)
      : super(_value, (v) => _then(v as _FormModel));

  @override
  _FormModel get _value => super._value as _FormModel;

  @override
  $Res call({
    Object? validator = freezed,
    Object? controller = freezed,
    Object? focusNode = freezed,
    Object? hasEdit = freezed,
  }) {
    return _then(_FormModel(
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      focusNode: focusNode == freezed
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      hasEdit: hasEdit == freezed
          ? _value.hasEdit
          : hasEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FormModel extends _FormModel {
  _$_FormModel(
      {required this.validator,
      required this.controller,
      required this.focusNode,
      this.hasEdit = false})
      : super._();

  @override
  final Validator validator;
  @override
  final TextEditingController controller;
  @override
  final FocusNode focusNode;
  @JsonKey()
  @override
  final bool hasEdit;

  @override
  String toString() {
    return 'FormModel(validator: $validator, controller: $controller, focusNode: $focusNode, hasEdit: $hasEdit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormModel &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            const DeepCollectionEquality()
                .equals(other.controller, controller) &&
            const DeepCollectionEquality().equals(other.focusNode, focusNode) &&
            const DeepCollectionEquality().equals(other.hasEdit, hasEdit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      validator,
      const DeepCollectionEquality().hash(controller),
      const DeepCollectionEquality().hash(focusNode),
      const DeepCollectionEquality().hash(hasEdit));

  @JsonKey(ignore: true)
  @override
  _$FormModelCopyWith<_FormModel> get copyWith =>
      __$FormModelCopyWithImpl<_FormModel>(this, _$identity);
}

abstract class _FormModel extends FormModel {
  factory _FormModel(
      {required Validator validator,
      required TextEditingController controller,
      required FocusNode focusNode,
      bool hasEdit}) = _$_FormModel;
  _FormModel._() : super._();

  @override
  Validator get validator;
  @override
  TextEditingController get controller;
  @override
  FocusNode get focusNode;
  @override
  bool get hasEdit;
  @override
  @JsonKey(ignore: true)
  _$FormModelCopyWith<_FormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
