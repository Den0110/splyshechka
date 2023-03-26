import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/entities/user/sleep_user_sign_in.dart';

part 'sleep_user_sign_in_dto.freezed.dart';

part 'sleep_user_sign_in_dto.g.dart';

@freezed
class SleepUserSignInDto with _$SleepUserSignInDto {
  const factory SleepUserSignInDto({
    required String username,
    required String password,
  }) = _SleepUserSignInDto;

  factory SleepUserSignInDto.fromJson(Map<String, dynamic> json) =>
      _$SleepUserSignInDtoFromJson(json);
}

extension SleepUserSignInMapper on SleepUserSignInDto {
  SleepUserSignIn toModel() {
    return SleepUserSignIn(
      username: username,
      password: password,
    );
  }

  static SleepUserSignInDto fromModel(SleepUserSignIn user) {
    return SleepUserSignInDto(
      username: user.username,
      password: user.password,
    );
  }
}
