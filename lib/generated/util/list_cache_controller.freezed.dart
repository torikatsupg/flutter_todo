// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../util/list_cache_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListCacheState<Item> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Item> items,
            CursorImpl? cursor,
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
            List<Item> items,
            CursorImpl? cursor,
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
            List<Item> items,
            CursorImpl? cursor,
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
    required TResult Function(_Data<Item> value) data,
    required TResult Function(_Error<Item> value) error,
    required TResult Function(_Loading<Item> value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCacheStateCopyWith<Item, $Res> {
  factory $ListCacheStateCopyWith(ListCacheState<Item> value,
          $Res Function(ListCacheState<Item>) then) =
      _$ListCacheStateCopyWithImpl<Item, $Res>;
}

/// @nodoc
class _$ListCacheStateCopyWithImpl<Item, $Res>
    implements $ListCacheStateCopyWith<Item, $Res> {
  _$ListCacheStateCopyWithImpl(this._value, this._then);

  final ListCacheState<Item> _value;
  // ignore: unused_field
  final $Res Function(ListCacheState<Item>) _then;
}

/// @nodoc
abstract class _$$_DataCopyWith<Item, $Res> {
  factory _$$_DataCopyWith(
          _$_Data<Item> value, $Res Function(_$_Data<Item>) then) =
      __$$_DataCopyWithImpl<Item, $Res>;
  $Res call(
      {List<Item> items,
      CursorImpl? cursor,
      dynamic isRefreshing,
      dynamic isMoreLoading,
      dynamic hasMoreData,
      dynamic refreshError,
      dynamic loadMoreError});
}

/// @nodoc
class __$$_DataCopyWithImpl<Item, $Res>
    extends _$ListCacheStateCopyWithImpl<Item, $Res>
    implements _$$_DataCopyWith<Item, $Res> {
  __$$_DataCopyWithImpl(
      _$_Data<Item> _value, $Res Function(_$_Data<Item>) _then)
      : super(_value, (v) => _then(v as _$_Data<Item>));

  @override
  _$_Data<Item> get _value => super._value as _$_Data<Item>;

  @override
  $Res call({
    Object? items = freezed,
    Object? cursor = freezed,
    Object? isRefreshing = freezed,
    Object? isMoreLoading = freezed,
    Object? hasMoreData = freezed,
    Object? refreshError = freezed,
    Object? loadMoreError = freezed,
  }) {
    return _then(_$_Data<Item>(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as CursorImpl?,
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

class _$_Data<Item> extends _Data<Item> {
  _$_Data(
      {final List<Item> items = const [],
      this.cursor,
      this.isRefreshing = false,
      this.isMoreLoading = false,
      this.hasMoreData = true,
      this.refreshError = null,
      this.loadMoreError = null})
      : _items = items,
        super._();

  final List<Item> _items;
  @override
  @JsonKey()
  List<Item> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CursorImpl? cursor;
  @override
  @JsonKey()
  final dynamic isRefreshing;
  @override
  @JsonKey()
  final dynamic isMoreLoading;
  @override
  @JsonKey()
  final dynamic hasMoreData;
  @override
  @JsonKey()
  final dynamic refreshError;
  @override
  @JsonKey()
  final dynamic loadMoreError;

  @override
  String toString() {
    return 'ListCacheState<$Item>.data(items: $items, cursor: $cursor, isRefreshing: $isRefreshing, isMoreLoading: $isMoreLoading, hasMoreData: $hasMoreData, refreshError: $refreshError, loadMoreError: $loadMoreError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data<Item> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.cursor, cursor) &&
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
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(cursor),
      const DeepCollectionEquality().hash(isRefreshing),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(hasMoreData),
      const DeepCollectionEquality().hash(refreshError),
      const DeepCollectionEquality().hash(loadMoreError));

  @JsonKey(ignore: true)
  @override
  _$$_DataCopyWith<Item, _$_Data<Item>> get copyWith =>
      __$$_DataCopyWithImpl<Item, _$_Data<Item>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Item> items,
            CursorImpl? cursor,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)
        data,
    required TResult Function() error,
    required TResult Function() loading,
  }) {
    return data(items, cursor, isRefreshing, isMoreLoading, hasMoreData,
        refreshError, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<Item> items,
            CursorImpl? cursor,
            dynamic isRefreshing,
            dynamic isMoreLoading,
            dynamic hasMoreData,
            dynamic refreshError,
            dynamic loadMoreError)?
        data,
    TResult Function()? error,
    TResult Function()? loading,
  }) {
    return data?.call(items, cursor, isRefreshing, isMoreLoading, hasMoreData,
        refreshError, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Item> items,
            CursorImpl? cursor,
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
      return data(items, cursor, isRefreshing, isMoreLoading, hasMoreData,
          refreshError, loadMoreError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<Item> value) data,
    required TResult Function(_Error<Item> value) error,
    required TResult Function(_Loading<Item> value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<Item> extends ListCacheState<Item> {
  factory _Data(
      {final List<Item> items,
      final CursorImpl? cursor,
      final dynamic isRefreshing,
      final dynamic isMoreLoading,
      final dynamic hasMoreData,
      final dynamic refreshError,
      final dynamic loadMoreError}) = _$_Data<Item>;
  _Data._() : super._();

  List<Item> get items => throw _privateConstructorUsedError;
  CursorImpl? get cursor => throw _privateConstructorUsedError;
  dynamic get isRefreshing => throw _privateConstructorUsedError;
  dynamic get isMoreLoading => throw _privateConstructorUsedError;
  dynamic get hasMoreData => throw _privateConstructorUsedError;
  dynamic get refreshError => throw _privateConstructorUsedError;
  dynamic get loadMoreError => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_DataCopyWith<Item, _$_Data<Item>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<Item, $Res> {
  factory _$$_ErrorCopyWith(
          _$_Error<Item> value, $Res Function(_$_Error<Item>) then) =
      __$$_ErrorCopyWithImpl<Item, $Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<Item, $Res>
    extends _$ListCacheStateCopyWithImpl<Item, $Res>
    implements _$$_ErrorCopyWith<Item, $Res> {
  __$$_ErrorCopyWithImpl(
      _$_Error<Item> _value, $Res Function(_$_Error<Item>) _then)
      : super(_value, (v) => _then(v as _$_Error<Item>));

  @override
  _$_Error<Item> get _value => super._value as _$_Error<Item>;
}

/// @nodoc

class _$_Error<Item> extends _Error<Item> {
  _$_Error() : super._();

  @override
  String toString() {
    return 'ListCacheState<$Item>.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Error<Item>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Item> items,
            CursorImpl? cursor,
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
            List<Item> items,
            CursorImpl? cursor,
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
            List<Item> items,
            CursorImpl? cursor,
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
    required TResult Function(_Data<Item> value) data,
    required TResult Function(_Error<Item> value) error,
    required TResult Function(_Loading<Item> value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<Item> extends ListCacheState<Item> {
  factory _Error() = _$_Error<Item>;
  _Error._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<Item, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<Item> value, $Res Function(_$_Loading<Item>) then) =
      __$$_LoadingCopyWithImpl<Item, $Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<Item, $Res>
    extends _$ListCacheStateCopyWithImpl<Item, $Res>
    implements _$$_LoadingCopyWith<Item, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<Item> _value, $Res Function(_$_Loading<Item>) _then)
      : super(_value, (v) => _then(v as _$_Loading<Item>));

  @override
  _$_Loading<Item> get _value => super._value as _$_Loading<Item>;
}

/// @nodoc

class _$_Loading<Item> extends _Loading<Item> {
  _$_Loading() : super._();

  @override
  String toString() {
    return 'ListCacheState<$Item>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading<Item>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Item> items,
            CursorImpl? cursor,
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
            List<Item> items,
            CursorImpl? cursor,
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
            List<Item> items,
            CursorImpl? cursor,
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
    required TResult Function(_Data<Item> value) data,
    required TResult Function(_Error<Item> value) error,
    required TResult Function(_Loading<Item> value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<Item> value)? data,
    TResult Function(_Error<Item> value)? error,
    TResult Function(_Loading<Item> value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<Item> extends ListCacheState<Item> {
  factory _Loading() = _$_Loading<Item>;
  _Loading._() : super._();
}
