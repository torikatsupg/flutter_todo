// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../provider/controller/todo_tab_controller_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoTabStateTearOff {
  const _$TodoTabStateTearOff();

  _Data data(
      {required ScrollController controller,
      List<Task> items = const [],
      List<CursorImpl> cursors = const [],
      dynamic isRefreshing = false,
      dynamic isMoreLoading = false,
      dynamic hasMoreData = true,
      dynamic refreshError = null,
      dynamic loadMoreError = null}) {
    return _Data(
      controller: controller,
      items: items,
      cursors: cursors,
      isRefreshing: isRefreshing,
      isMoreLoading: isMoreLoading,
      hasMoreData: hasMoreData,
      refreshError: refreshError,
      loadMoreError: loadMoreError,
    );
  }

  _Error error() {
    return _Error();
  }

  _Loading loading() {
    return _Loading();
  }
}

/// @nodoc
const $TodoTabState = _$TodoTabStateTearOff();

/// @nodoc
mixin _$TodoTabState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)
        data,
    required TResult Function() error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoTabStateCopyWith<$Res> {
  factory $TodoTabStateCopyWith(
          TodoTabState value, $Res Function(TodoTabState) then) =
      _$TodoTabStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoTabStateCopyWithImpl<$Res> implements $TodoTabStateCopyWith<$Res> {
  _$TodoTabStateCopyWithImpl(this._value, this._then);

  final TodoTabState _value;
  // ignore: unused_field
  final $Res Function(TodoTabState) _then;
}

/// @nodoc
abstract class _$DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  $Res call(
      {ScrollController controller,
      List<Task> items,
      List<CursorImpl> cursors,
      dynamic isRefreshing,
      dynamic isMoreLoading,
      dynamic hasMoreData,
      dynamic refreshError,
      dynamic loadMoreError});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$TodoTabStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object? controller = freezed,
    Object? items = freezed,
    Object? cursors = freezed,
    Object? isRefreshing = freezed,
    Object? isMoreLoading = freezed,
    Object? hasMoreData = freezed,
    Object? refreshError = freezed,
    Object? loadMoreError = freezed,
  }) {
    return _then(_Data(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      cursors: cursors == freezed
          ? _value.cursors
          : cursors // ignore: cast_nullable_to_non_nullable
              as List<CursorImpl>,
      isRefreshing:
          isRefreshing == freezed ? _value.isRefreshing : isRefreshing,
      isMoreLoading:
          isMoreLoading == freezed ? _value.isMoreLoading : isMoreLoading,
      hasMoreData: hasMoreData == freezed ? _value.hasMoreData : hasMoreData,
      refreshError: refreshError == freezed
          ? _value.refreshError
          : refreshError // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loadMoreError: loadMoreError == freezed
          ? _value.loadMoreError
          : loadMoreError // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_Data extends _Data {
  _$_Data(
      {required this.controller,
      this.items = const [],
      this.cursors = const [],
      this.isRefreshing = false,
      this.isMoreLoading = false,
      this.hasMoreData = true,
      this.refreshError = null,
      this.loadMoreError = null})
      : super._();

  @override
  final ScrollController controller;
  @JsonKey()
  @override
  final List<Task> items;
  @JsonKey()
  @override
  final List<CursorImpl> cursors;
  @JsonKey()
  @override
  final dynamic isRefreshing;
  @JsonKey()
  @override
  final dynamic isMoreLoading;
  @JsonKey()
  @override
  final dynamic hasMoreData;
  @JsonKey()
  @override
  final dynamic refreshError;
  @JsonKey()
  @override
  final dynamic loadMoreError;

  @override
  String toString() {
    return 'TodoTabState.data(controller: $controller, items: $items, cursors: $cursors, isRefreshing: $isRefreshing, isMoreLoading: $isMoreLoading, hasMoreData: $hasMoreData, refreshError: $refreshError, loadMoreError: $loadMoreError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            const DeepCollectionEquality()
                .equals(other.controller, controller) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.cursors, cursors) &&
            const DeepCollectionEquality()
                .equals(other.isRefreshing, isRefreshing) &&
            const DeepCollectionEquality()
                .equals(other.isMoreLoading, isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other.hasMoreData, hasMoreData) &&
            const DeepCollectionEquality()
                .equals(other.refreshError, refreshError) &&
            const DeepCollectionEquality()
                .equals(other.loadMoreError, loadMoreError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(controller),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(cursors),
      const DeepCollectionEquality().hash(isRefreshing),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(hasMoreData),
      const DeepCollectionEquality().hash(refreshError),
      const DeepCollectionEquality().hash(loadMoreError));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)
        data,
    required TResult Function() error,
    required TResult Function() loading,
  }) {
    return data(controller, items, cursors, isRefreshing, isMoreLoading,
        hasMoreData, refreshError, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
  }) {
    return data?.call(controller, items, cursors, isRefreshing, isMoreLoading,
        hasMoreData, refreshError, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(controller, items, cursors, isRefreshing, isMoreLoading,
          hasMoreData, refreshError, loadMoreError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data extends TodoTabState {
  factory _Data(
      {required ScrollController controller,
      List<Task> items,
      List<CursorImpl> cursors,
      dynamic isRefreshing,
      dynamic isMoreLoading,
      dynamic hasMoreData,
      dynamic refreshError,
      dynamic loadMoreError}) = _$_Data;
  _Data._() : super._();

  ScrollController get controller;
  List<Task> get items;
  List<CursorImpl> get cursors;
  dynamic get isRefreshing;
  dynamic get isMoreLoading;
  dynamic get hasMoreData;
  dynamic get refreshError;
  dynamic get loadMoreError;
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$TodoTabStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc

class _$_Error extends _Error {
  _$_Error() : super._();

  @override
  String toString() {
    return 'TodoTabState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)
        data,
    required TResult Function() error,
    required TResult Function() loading,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends TodoTabState {
  factory _Error() = _$_Error;
  _Error._() : super._();
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$TodoTabStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading extends _Loading {
  _$_Loading() : super._();

  @override
  String toString() {
    return 'TodoTabState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)
        data,
    required TResult Function() error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ScrollController controller,
            List<Task> items,
            List<CursorImpl> cursors,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends TodoTabState {
  factory _Loading() = _$_Loading;
  _Loading._() : super._();
}
