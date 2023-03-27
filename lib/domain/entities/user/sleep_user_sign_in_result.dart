import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_user_sign_in_result.freezed.dart';

@freezed
class SleepUserSignInResult with _$SleepUserSignInResult {
  const factory SleepUserSignInResult({
    required String token,
  }) = _SleepUserSignInResult;
}
