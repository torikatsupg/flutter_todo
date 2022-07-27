import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/result.freezed.dart';

@freezed
class Result<Data, Err> with _$Result<Data, Err> {
  factory Result.ok(Data value) = Ok;
  factory Result.err(Err value) = Error;

  Result._();
}
