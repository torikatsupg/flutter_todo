import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/model/result.dart';

extension AsyncValueExt<Data, Err> on AsyncValue<Result<Data, Err>> {
  T maybeFlatMap<T>(
    T Function(Data data) data,
    T orElse,
  ) =>
      maybeMap<T>(
        data: (v) => v.value.map<T>(
          ok: (ok) => data(ok.value),
          err: (e) => orElse,
        ),
        orElse: () => orElse,
      );

  AsyncValue<Result<T, Err>> flatMapData<T>(
    T Function(Data) functor,
  ) =>
      map(
        data: (v) => v.whenData(
          (v) => v.map_(ok: functor, err: (e) => e),
        ),
        loading: (_) => AsyncValue<Result<T, Err>>.loading(),
        error: (e) => AsyncValue<Result<T, Err>>.error(e),
      );

  void flatWhenData(
    void Function(Data) functor,
  ) =>
      map(
        data: (v) => v.value.maybeWhen(
          ok: functor,
          orElse: () => null,
        ),
        loading: (_) {},
        error: (_) {},
      );
}

extension AsyncValueWithFirestoreErrorExt<Data>
    on AsyncValue<Result<Data, FirestoreError>> {
  T flatMap<T>({
    required T Function(Data data) data,
    required T Function() loading,
    T Function()? notFound,
    T Function()? error,
    T Function()? orElse,
  }) =>
      maybeMap<T>(
        data: (v) => v.value.map<T>(
          ok: (ok) => data(ok.value),
          err: (e) => e.value.maybeMap(
            notFound: error,
            error: notFound,
            orElse: orElse,
          ),
        ),
        orElse: loading,
      );
}
