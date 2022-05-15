// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../provider/controller/done_tab_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$_DoneTabStateTearOff {
  const _$_DoneTabStateTearOff();

  __DoneTabState call(
      {required ListCacheState<Task> list,
      required ScrollController scrollController}) {
    return __DoneTabState(
      list: list,
      scrollController: scrollController,
    );
  }
}

/// @nodoc
const _$DoneTabState = _$_DoneTabStateTearOff();

/// @nodoc
mixin _$_DoneTabState {
  ListCacheState<Task> get list => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$DoneTabStateCopyWith<_DoneTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DoneTabStateCopyWith<$Res> {
  factory _$DoneTabStateCopyWith(
          _DoneTabState value, $Res Function(_DoneTabState) then) =
      __$DoneTabStateCopyWithImpl<$Res>;
  $Res call({ListCacheState<Task> list, ScrollController scrollController});

  $ListCacheStateCopyWith<Task, $Res> get list;
}

/// @nodoc
class __$DoneTabStateCopyWithImpl<$Res>
    implements _$DoneTabStateCopyWith<$Res> {
  __$DoneTabStateCopyWithImpl(this._value, this._then);

  final _DoneTabState _value;
  // ignore: unused_field
  final $Res Function(_DoneTabState) _then;

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
abstract class _$_DoneTabStateCopyWith<$Res>
    implements _$DoneTabStateCopyWith<$Res> {
  factory _$_DoneTabStateCopyWith(
          __DoneTabState value, $Res Function(__DoneTabState) then) =
      __$_DoneTabStateCopyWithImpl<$Res>;
  @override
  $Res call({ListCacheState<Task> list, ScrollController scrollController});

  @override
  $ListCacheStateCopyWith<Task, $Res> get list;
}

/// @nodoc
class __$_DoneTabStateCopyWithImpl<$Res>
    extends __$DoneTabStateCopyWithImpl<$Res>
    implements _$_DoneTabStateCopyWith<$Res> {
  __$_DoneTabStateCopyWithImpl(
      __DoneTabState _value, $Res Function(__DoneTabState) _then)
      : super(_value, (v) => _then(v as __DoneTabState));

  @override
  __DoneTabState get _value => super._value as __DoneTabState;

  @override
  $Res call({
    Object? list = freezed,
    Object? scrollController = freezed,
  }) {
    return _then(__DoneTabState(
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

class _$__DoneTabState extends __DoneTabState {
  _$__DoneTabState({required this.list, required this.scrollController})
      : super._();

  @override
  final ListCacheState<Task> list;
  @override
  final ScrollController scrollController;

  @override
  String toString() {
    return '_DoneTabState(list: $list, scrollController: $scrollController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is __DoneTabState &&
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
  _$_DoneTabStateCopyWith<__DoneTabState> get copyWith =>
      __$_DoneTabStateCopyWithImpl<__DoneTabState>(this, _$identity);
}

abstract class __DoneTabState extends _DoneTabState {
  factory __DoneTabState(
      {required ListCacheState<Task> list,
      required ScrollController scrollController}) = _$__DoneTabState;
  __DoneTabState._() : super._();

  @override
  ListCacheState<Task> get list;
  @override
  ScrollController get scrollController;
  @override
  @JsonKey(ignore: true)
  _$_DoneTabStateCopyWith<__DoneTabState> get copyWith =>
      throw _privateConstructorUsedError;
}
