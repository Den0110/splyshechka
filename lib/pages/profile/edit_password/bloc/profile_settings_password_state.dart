part of 'profile_settings_password_bloc.dart';

@Freezed(equal: false)
class ProfileSettingsPasswordState with _$ProfileSettingsPasswordState {
  const factory ProfileSettingsPasswordState({
    required SleepUser user,
    required PasswordState state,
    required String code,
    required String password,
  }) = _ProfileSettingsPasswordState;

  @Implements<OneShotState>()
  factory ProfileSettingsPasswordState.navToBack() = NavToBack;
}

enum PasswordState { initial, codeSent }
