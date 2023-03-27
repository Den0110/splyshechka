import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_user_sign_up_dto.freezed.dart';

part 'sleep_user_sign_up_dto.g.dart';

@freezed
class SleepUserSignUpDto with _$SleepUserSignUpDto {
  const factory SleepUserSignUpDto({
    required String username,
    required String fullName,
    required String email,
    required String password,
    required String gender,
  }) = _SleepUserSignUpDto;

  factory SleepUserSignUpDto.fromJson(Map<String, dynamic> json) =>
      _$SleepUserSignUpDtoFromJson(json);
}
