import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/result.freezed.dart';

@freezed
class Result<Data, Error> with _$Result<Data, Error> {
  factory Result.ok([Data? value]) = Ok;
  factory Result.err(Error value) = Err;

  Result._();
}
