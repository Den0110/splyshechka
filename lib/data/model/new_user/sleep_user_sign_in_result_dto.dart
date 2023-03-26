import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/entities/user/sleep_user_sign_in_result.dart';

part 'sleep_user_sign_in_result_dto.freezed.dart';

part 'sleep_user_sign_in_result_dto.g.dart';

@freezed
class SleepUserSignInResultDto with _$SleepUserSignInResultDto {
  const factory SleepUserSignInResultDto({
    required String token,
  }) = _SleepUserSignInResultDto;

  factory SleepUserSignInResultDto.fromJson(Map<String, dynamic> json) =>
      _$SleepUserSignInResultDtoFromJson(json);
}

extension SleepUserSignInResultMapper on SleepUserSignInResultDto {
  SleepUserSignInResult toModel() {
    return SleepUserSignInResult(
      token: token,
    );
  }

  static SleepUserSignInResultDto fromModel(SleepUserSignInResult user) {
    return SleepUserSignInResultDto(
      token: user.token,
    );
  }
}
