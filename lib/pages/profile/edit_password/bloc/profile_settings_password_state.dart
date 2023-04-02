part of 'profile_settings_password_bloc.dart';

@Freezed(equal: false)
class ProfileSettingsPasswordState with _$ProfileSettingsPasswordState {
  const factory ProfileSettingsPasswordState({
    required SleepUser user,
    required PasswordState state,
    required String code,
    required String password,
    required String? wrongPassword,
    required String? wrongCode,
  }) = _ProfileSettingsPasswordState;

}

enum PasswordState { initial, codeSent }
