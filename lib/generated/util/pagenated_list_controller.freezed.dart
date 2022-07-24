// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../util/pagenated_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PagenatedList<Item, Err> {
  List<Item> get list => throw _privateConstructorUsedError;
  CursorImpl? get cursor => throw _privateConstructorUsedError;
  dynamic get isRefreshing => throw _privateConstructorUsedError;
  dynamic get isMoreLoading => throw _privateConstructorUsedError;
  dynamic get hasMoreData => throw _privateConstructorUsedError;
  Err? get refreshError => throw _privateConstructorUsedError;
  Err? get loadMoreError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagenatedListCopyWith<Item, Err, PagenatedList<Item, Err>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagenatedListCopyWith<Item, Err, $Res> {
  factory $PagenatedListCopyWith(PagenatedList<Item, Err> value,
          $Res Function(PagenatedList<Item, Err>) then) =
      _$PagenatedListCopyWithImpl<Item, Err, $Res>;
  $Res call(
      {List<Item> list,
      CursorImpl? cursor,
      dynamic isRefreshing,
      dynamic isMoreLoading,
      dynamic hasMoreData,
      Err? refreshError,
      Err? loadMoreError});
}

/// @nodoc
class _$PagenatedListCopyWithImpl<Item, Err, $Res>
    implements $PagenatedListCopyWith<Item, Err, $Res> {
  _$PagenatedListCopyWithImpl(this._value, this._then);

  final PagenatedList<Item, Err> _value;
  // ignore: unused_field
  final $Res Function(PagenatedList<Item, Err>) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? cursor = freezed,
    Object? isRefreshing = freezed,
    Object? isMoreLoading = freezed,
    Object? hasMoreData = freezed,
    Object? refreshError = freezed,
    Object? loadMoreError = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as CursorImpl?,
      isRefreshing: isRefreshing == freezed
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasMoreData: hasMoreData == freezed
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refreshError: refreshError == freezed
          ? _value.refreshError
          : refreshError // ignore: cast_nullable_to_non_nullable
              as Err?,
      loadMoreError: loadMoreError == freezed
          ? _value.loadMoreError
          : loadMoreError // ignore: cast_nullable_to_non_nullable
              as Err?,
    ));
  }
}

/// @nodoc
abstract class _$$_PagenatedListCopyWith<Item, Err, $Res>
    implements $PagenatedListCopyWith<Item, Err, $Res> {
  factory _$$_PagenatedListCopyWith(_$_PagenatedList<Item, Err> value,
          $Res Function(_$_PagenatedList<Item, Err>) then) =
      __$$_PagenatedListCopyWithImpl<Item, Err, $Res>;
  @override
  $Res call(
      {List<Item> list,
      CursorImpl? cursor,
      dynamic isRefreshing,
      dynamic isMoreLoading,
      dynamic hasMoreData,
      Err? refreshError,
      Err? loadMoreError});
}

/// @nodoc
class __$$_PagenatedListCopyWithImpl<Item, Err, $Res>
    extends _$PagenatedListCopyWithImpl<Item, Err, $Res>
    implements _$$_PagenatedListCopyWith<Item, Err, $Res> {
  __$$_PagenatedListCopyWithImpl(_$_PagenatedList<Item, Err> _value,
      $Res Function(_$_PagenatedList<Item, Err>) _then)
      : super(_value, (v) => _then(v as _$_PagenatedList<Item, Err>));

  @override
  _$_PagenatedList<Item, Err> get _value =>
      super._value as _$_PagenatedList<Item, Err>;

  @override
  $Res call({
    Object? list = freezed,
    Object? cursor = freezed,
    Object? isRefreshing = freezed,
    Object? isMoreLoading = freezed,
    Object? hasMoreData = freezed,
    Object? refreshError = freezed,
    Object? loadMoreError = freezed,
  }) {
    return _then(_$_PagenatedList<Item, Err>(
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
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
              as Err?,
      loadMoreError: loadMoreError == freezed
          ? _value.loadMoreError
          : loadMoreError // ignore: cast_nullable_to_non_nullable
              as Err?,
    ));
  }
}

/// @nodoc

class _$_PagenatedList<Item, Err> extends _PagenatedList<Item, Err> {
  _$_PagenatedList(
      {final List<Item> list = const [],
      this.cursor,
      this.isRefreshing = false,
      this.isMoreLoading = false,
      this.hasMoreData = true,
      this.refreshError = null,
      this.loadMoreError = null})
      : _list = list,
        super._();

  final List<Item> _list;
  @override
  @JsonKey()
  List<Item> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
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
  final Err? refreshError;
  @override
  @JsonKey()
  final Err? loadMoreError;

  @override
  String toString() {
    return 'PagenatedList<$Item, $Err>(list: $list, cursor: $cursor, isRefreshing: $isRefreshing, isMoreLoading: $isMoreLoading, hasMoreData: $hasMoreData, refreshError: $refreshError, loadMoreError: $loadMoreError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagenatedList<Item, Err> &&
            const DeepCollectionEquality().equals(other._list, _list) &&
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
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(cursor),
      const DeepCollectionEquality().hash(isRefreshing),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(hasMoreData),
      const DeepCollectionEquality().hash(refreshError),
      const DeepCollectionEquality().hash(loadMoreError));

  @JsonKey(ignore: true)
  @override
  _$$_PagenatedListCopyWith<Item, Err, _$_PagenatedList<Item, Err>>
      get copyWith => __$$_PagenatedListCopyWithImpl<Item, Err,
          _$_PagenatedList<Item, Err>>(this, _$identity);
}

abstract class _PagenatedList<Item, Err> extends PagenatedList<Item, Err> {
  factory _PagenatedList(
      {final List<Item> list,
      final CursorImpl? cursor,
      final dynamic isRefreshing,
      final dynamic isMoreLoading,
      final dynamic hasMoreData,
      final Err? refreshError,
      final Err? loadMoreError}) = _$_PagenatedList<Item, Err>;
  _PagenatedList._() : super._();

  @override
  List<Item> get list => throw _privateConstructorUsedError;
  @override
  CursorImpl? get cursor => throw _privateConstructorUsedError;
  @override
  dynamic get isRefreshing => throw _privateConstructorUsedError;
  @override
  dynamic get isMoreLoading => throw _privateConstructorUsedError;
  @override
  dynamic get hasMoreData => throw _privateConstructorUsedError;
  @override
  Err? get refreshError => throw _privateConstructorUsedError;
  @override
  Err? get loadMoreError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PagenatedListCopyWith<Item, Err, _$_PagenatedList<Item, Err>>
      get copyWith => throw _privateConstructorUsedError;
}
