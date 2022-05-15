// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../provider/controller/todo_tab_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$_TodoTabStateTearOff {
  const _$_TodoTabStateTearOff();

  __TodoTabState call(
      {required ListCacheState<Task> list,
      required ScrollController scrollController}) {
    return __TodoTabState(
      list: list,
      scrollController: scrollController,
    );
  }
}

/// @nodoc
const _$TodoTabState = _$_TodoTabStateTearOff();

/// @nodoc
mixin _$_TodoTabState {
  ListCacheState<Task> get list => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$TodoTabStateCopyWith<_TodoTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TodoTabStateCopyWith<$Res> {
  factory _$TodoTabStateCopyWith(
          _TodoTabState value, $Res Function(_TodoTabState) then) =
      __$TodoTabStateCopyWithImpl<$Res>;
  $Res call({ListCacheState<Task> list, ScrollController scrollController});

  $ListCacheStateCopyWith<Task, $Res> get list;
}

/// @nodoc
class __$TodoTabStateCopyWithImpl<$Res>
    implements _$TodoTabStateCopyWith<$Res> {
  __$TodoTabStateCopyWithImpl(this._value, this._then);

  final _TodoTabState _value;
  // ignore: unused_field
  final $Res Function(_TodoTabState) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? scrollController = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListCacheState<Task>,
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
    ));
  }

  @override
  $ListCacheStateCopyWith<Task, $Res> get list {
    return $ListCacheStateCopyWith<Task, $Res>(_value.list, (value) {
      return _then(_value.copyWith(list: value));
    });
  }
}

/// @nodoc
abstract class _$_TodoTabStateCopyWith<$Res>
    implements _$TodoTabStateCopyWith<$Res> {
  factory _$_TodoTabStateCopyWith(
          __TodoTabState value, $Res Function(__TodoTabState) then) =
      __$_TodoTabStateCopyWithImpl<$Res>;
  @override
  $Res call({ListCacheState<Task> list, ScrollController scrollController});

  @override
  $ListCacheStateCopyWith<Task, $Res> get list;
}

/// @nodoc
class __$_TodoTabStateCopyWithImpl<$Res>
    extends __$TodoTabStateCopyWithImpl<$Res>
    implements _$_TodoTabStateCopyWith<$Res> {
  __$_TodoTabStateCopyWithImpl(
      __TodoTabState _value, $Res Function(__TodoTabState) _then)
      : super(_value, (v) => _then(v as __TodoTabState));

  @override
  __TodoTabState get _value => super._value as __TodoTabState;

  @override
  $Res call({
    Object? list = freezed,
    Object? scrollController = freezed,
  }) {
    return _then(__TodoTabState(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListCacheState<Task>,
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
    ));
  }
}

/// @nodoc

class _$__TodoTabState extends __TodoTabState {
  _$__TodoTabState({required this.list, required this.scrollController})
      : super._();

  @override
  final ListCacheState<Task> list;
  @override
  final ScrollController scrollController;

  @override
  String toString() {
    return '_TodoTabState(list: $list, scrollController: $scrollController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is __TodoTabState &&
            const DeepCollectionEquality().equals(other.list, list) &&
            const DeepCollectionEquality()
                .equals(other.scrollController, scrollController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(list),
      const DeepCollectionEquality().hash(scrollController));

  @JsonKey(ignore: true)
  @override
  _$_TodoTabStateCopyWith<__TodoTabState> get copyWith =>
      __$_TodoTabStateCopyWithImpl<__TodoTabState>(this, _$identity);
}

abstract class __TodoTabState extends _TodoTabState {
  factory __TodoTabState(
      {required ListCacheState<Task> list,
      required ScrollController scrollController}) = _$__TodoTabState;
  __TodoTabState._() : super._();

  @override
  ListCacheState<Task> get list;
  @override
  ScrollController get scrollController;
  @override
  @JsonKey(ignore: true)
  _$_TodoTabStateCopyWith<__TodoTabState> get copyWith =>
      throw _privateConstructorUsedError;
}
