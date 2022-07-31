import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/util/tupple.freezed.dart';

@freezed
class T2<V1, V2> with _$T2<V1, V2> {
  factory T2(
    V1 v1,
    V2 v2,
  ) = _T2;

  T2._();
}
