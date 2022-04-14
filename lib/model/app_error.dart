import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/app_error.freezed.dart';

// TODO(torikatsu): Errorを集約する
@freezed
class AppError with _$AppError {
  factory AppError.unknown() = UnknownError;

  AppError._();
}