import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_dto.freezed.dart';

part 'field_dto.g.dart';

@freezed
class FieldDto with _$FieldDto {
  const factory FieldDto({
    required String field,
  }) = _FieldDto;

  factory FieldDto.fromJson(Map<String, dynamic> json) =>
      _$FieldDtoFromJson(json);
}