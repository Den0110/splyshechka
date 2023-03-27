import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_user_sign_in.freezed.dart';

@freezed
class SleepUserSignIn with _$SleepUserSignIn {
  const factory SleepUserSignIn({
    required String username,
    required String password,
  }) = _SleepUserSignIn;
}
