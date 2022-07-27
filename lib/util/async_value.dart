import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/model/result.dart';

extension AsyncValueExt<Data, Err> on AsyncValue<Result<Data, Err>> {
  T flatMap<T>({
    required T Function(Data data) data,
    required T Function(Err err) error,
    required T Function() loading,
  }) =>
      maybeMap<T>(
        data: (v) => v.value.map<T>(
          ok: (ok) => data(ok.value),
          err: (e) => error(e.value),
        ),
        orElse: loading,
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
