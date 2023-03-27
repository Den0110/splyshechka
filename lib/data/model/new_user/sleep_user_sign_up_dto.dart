import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/entities/user/sleep_user_sign_up.dart';

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

extension SleepUserSignUpMapper on SleepUserSignUpDto {
  SleepUserSignUp toModel() {
    return SleepUserSignUp(
      username: username,
      fullName: fullName,
      email: email,
      password: password,
      gender: gender,
    );
  }

  static SleepUserSignUpDto fromModel(SleepUserSignUp user) {
    return SleepUserSignUpDto(
      username: user.username,
      fullName: user.fullName,
      email: user.email,
      password: user.password,
      gender: user.gender,
    );
  }
}
