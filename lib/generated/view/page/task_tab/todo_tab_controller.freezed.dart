// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../view/page/task_tab/todo_tab_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$_TodoTabState {
  AsyncValue<Result<PagenatedList<Task, FirestoreError>, FirestoreError>>
      get list => throw _privateConstructorUsedError;
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
  $Res call(
      {AsyncValue<Result<PagenatedList<Task, FirestoreError>, FirestoreError>>
          list,
      ScrollController scrollController});
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
              as AsyncValue<
                  Result<PagenatedList<Task, FirestoreError>, FirestoreError>>,
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
    ));
  }
}

/// @nodoc
abstract class _$$__TodoTabStateCopyWith<$Res>
    implements _$TodoTabStateCopyWith<$Res> {
  factory _$$__TodoTabStateCopyWith(
          _$__TodoTabState value, $Res Function(_$__TodoTabState) then) =
      __$$__TodoTabStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncValue<Result<PagenatedList<Task, FirestoreError>, FirestoreError>>
          list,
      ScrollController scrollController});
}

/// @nodoc
class __$$__TodoTabStateCopyWithImpl<$Res>
    extends __$TodoTabStateCopyWithImpl<$Res>
    implements _$$__TodoTabStateCopyWith<$Res> {
  __$$__TodoTabStateCopyWithImpl(
      _$__TodoTabState _value, $Res Function(_$__TodoTabState) _then)
      : super(_value, (v) => _then(v as _$__TodoTabState));

  @override
  _$__TodoTabState get _value => super._value as _$__TodoTabState;

  @override
  $Res call({
    Object? list = freezed,
    Object? scrollController = freezed,
  }) {
    return _then(_$__TodoTabState(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as AsyncValue<
                  Result<PagenatedList<Task, FirestoreError>, FirestoreError>>,
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
  final AsyncValue<Result<PagenatedList<Task, FirestoreError>, FirestoreError>>
      list;
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
            other is _$__TodoTabState &&
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
  _$$__TodoTabStateCopyWith<_$__TodoTabState> get copyWith =>
      __$$__TodoTabStateCopyWithImpl<_$__TodoTabState>(this, _$identity);
}

abstract class __TodoTabState extends _TodoTabState {
  factory __TodoTabState(
      {required final AsyncValue<
              Result<PagenatedList<Task, FirestoreError>, FirestoreError>>
          list,
      required final ScrollController scrollController}) = _$__TodoTabState;
  __TodoTabState._() : super._();

  @override
  AsyncValue<Result<PagenatedList<Task, FirestoreError>, FirestoreError>>
      get list => throw _privateConstructorUsedError;
  @override
  ScrollController get scrollController => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$__TodoTabStateCopyWith<_$__TodoTabState> get copyWith =>
      throw _privateConstructorUsedError;
}
