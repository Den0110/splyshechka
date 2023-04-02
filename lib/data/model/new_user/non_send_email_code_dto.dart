import 'package:freezed_annotation/freezed_annotation.dart';

part 'non_send_email_code_dto.freezed.dart';

part 'non_send_email_code_dto.g.dart';

@freezed
class NonSendEmailCodeDto with _$NonSendEmailCodeDto {
  const factory NonSendEmailCodeDto({
    required String email,
  }) = _NonSendEmailCodeDto;

  factory NonSendEmailCodeDto.fromJson(Map<String, dynamic> json) =>
      _$NonSendEmailCodeDtoFromJson(json);
}
