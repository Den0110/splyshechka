import 'package:freezed_annotation/freezed_annotation.dart';

part 'non_reset_password_dto.freezed.dart';

part 'non_reset_password_dto.g.dart';

@freezed
class NonResetPasswordDto with _$NonResetPasswordDto {
  const factory NonResetPasswordDto({
    required String resetCode,
    required String newPassword,
  }) = _NonResetPasswordDto;

  factory NonResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$NonResetPasswordDtoFromJson(json);
}
