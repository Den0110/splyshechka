import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_avatar_dto.freezed.dart';

part 'field_avatar_dto.g.dart';

@freezed
class FieldAvatarDto with _$FieldAvatarDto {
  const factory FieldAvatarDto({
    required int field,
  }) = _FieldAvatarDto;

  factory FieldAvatarDto.fromJson(Map<String, dynamic> json) =>
      _$FieldAvatarDtoFromJson(json);
}