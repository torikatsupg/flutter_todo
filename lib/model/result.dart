import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/result.freezed.dart';

@freezed
class Result<Data, Err> with _$Result<Data, Err> {
  factory Result.ok(Data value) = Ok;
  factory Result.err(Err value) = Error;

  T flatMap<T>({
    required T Function(Data) ok,
    required T Function(Err) err,
  }) =>
      map(
        ok: (data) => ok(data.value),
        err: (e) => err(e.value),
      );

  Result<T, E> map_<T, E>({
    required T Function(Data) ok,
    required E Function(Err) err,
  }) =>
      map(
        ok: (v) => Result.ok(ok(v.value)),
        err: (e) => Result.err(err(e.value)),
      );

  Result._();
}
