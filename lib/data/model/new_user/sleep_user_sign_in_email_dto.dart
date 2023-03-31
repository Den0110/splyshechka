import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_user_sign_in_email_dto.freezed.dart';

part 'sleep_user_sign_in_email_dto.g.dart';

@freezed
class SleepUserSignInEmailDto with _$SleepUserSignInEmailDto {
  const factory SleepUserSignInEmailDto({
    required String email,
    required String password,
  }) = _SleepUserSignInEmailDto;

  factory SleepUserSignInEmailDto.fromJson(Map<String, dynamic> json) =>
      _$SleepUserSignInEmailDtoFromJson(json);
}
