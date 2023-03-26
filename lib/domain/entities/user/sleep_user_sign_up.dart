import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_user_sign_up.freezed.dart';

@freezed
class SleepUserSignUp with _$SleepUserSignUp {
  const factory SleepUserSignUp({
    required String username,
    required String fullName,
    required String email,
    required String password,
    required String gender,
  }) = _SleepUserSignUp;
}
