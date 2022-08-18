// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormModel {
  Validator get validator => throw _privateConstructorUsedError;
  TextEditingController get controller => throw _privateConstructorUsedError;
  FocusNode get focusNode => throw _privateConstructorUsedError;
  bool get hasEdit => throw _privateConstructorUsedError;
  List<String> get serverErrors => throw _privateConstructorUsedError;

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
      bool hasEdit,
      List<String> serverErrors});
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
    Object? serverErrors = freezed,
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
      serverErrors: serverErrors == freezed
          ? _value.serverErrors
          : serverErrors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_FormModelCopyWith<$Res> implements $FormModelCopyWith<$Res> {
  factory _$$_FormModelCopyWith(
          _$_FormModel value, $Res Function(_$_FormModel) then) =
      __$$_FormModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {Validator validator,
      TextEditingController controller,
      FocusNode focusNode,
      bool hasEdit,
      List<String> serverErrors});
}

/// @nodoc
class __$$_FormModelCopyWithImpl<$Res> extends _$FormModelCopyWithImpl<$Res>
    implements _$$_FormModelCopyWith<$Res> {
  __$$_FormModelCopyWithImpl(
      _$_FormModel _value, $Res Function(_$_FormModel) _then)
      : super(_value, (v) => _then(v as _$_FormModel));

  @override
  _$_FormModel get _value => super._value as _$_FormModel;

  @override
  $Res call({
    Object? validator = freezed,
    Object? controller = freezed,
    Object? focusNode = freezed,
    Object? hasEdit = freezed,
    Object? serverErrors = freezed,
  }) {
    return _then(_$_FormModel(
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
      serverErrors: serverErrors == freezed
          ? _value._serverErrors
          : serverErrors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FormModel extends _FormModel {
  _$_FormModel(
      {required this.validator,
      required this.controller,
      required this.focusNode,
      this.hasEdit = false,
      final List<String> serverErrors = const []})
      : _serverErrors = serverErrors,
        super._();

  @override
  final Validator validator;
  @override
  final TextEditingController controller;
  @override
  final FocusNode focusNode;
  @override
  @JsonKey()
  final bool hasEdit;
  final List<String> _serverErrors;
  @override
  @JsonKey()
  List<String> get serverErrors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serverErrors);
  }

  @override
  String toString() {
    return 'FormModel(validator: $validator, controller: $controller, focusNode: $focusNode, hasEdit: $hasEdit, serverErrors: $serverErrors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormModel &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            const DeepCollectionEquality()
                .equals(other.controller, controller) &&
            const DeepCollectionEquality().equals(other.focusNode, focusNode) &&
            const DeepCollectionEquality().equals(other.hasEdit, hasEdit) &&
            const DeepCollectionEquality()
                .equals(other._serverErrors, _serverErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      validator,
      const DeepCollectionEquality().hash(controller),
      const DeepCollectionEquality().hash(focusNode),
      const DeepCollectionEquality().hash(hasEdit),
      const DeepCollectionEquality().hash(_serverErrors));

  @JsonKey(ignore: true)
  @override
  _$$_FormModelCopyWith<_$_FormModel> get copyWith =>
      __$$_FormModelCopyWithImpl<_$_FormModel>(this, _$identity);
}

abstract class _FormModel extends FormModel {
  factory _FormModel(
      {required final Validator validator,
      required final TextEditingController controller,
      required final FocusNode focusNode,
      final bool hasEdit,
      final List<String> serverErrors}) = _$_FormModel;
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
  List<String> get serverErrors;
  @override
  @JsonKey(ignore: true)
  _$$_FormModelCopyWith<_$_FormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
