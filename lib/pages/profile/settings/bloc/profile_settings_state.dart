part of 'profile_settings_bloc.dart';

@Freezed(equal:false)
class ProfileSettingsState with _$ProfileSettingsState {

  const factory ProfileSettingsState({
    required SleepUser user,
  }) = _ProfileSettingsState;

  @Implements<OneShotState>()
  factory ProfileSettingsState.navToSettingsAvatar() = NavToSettingsAvatar;

  @Implements<OneShotState>()
  factory ProfileSettingsState.navToSettingsEmail() = NavToSettingsEmail;

  @Implements<OneShotState>()
  factory ProfileSettingsState.navToSettingsName() = NavToSettingsName;

  @Implements<OneShotState>()
  factory ProfileSettingsState.navToSettingsPassword() = NavToSettingsPassword;

  @Implements<OneShotState>()
  factory ProfileSettingsState.navToSettingsGender() = NavToSettingsGender;

  @Implements<OneShotState>()
  factory ProfileSettingsState.navToDeleteAccount() = NavToDeleteAccount;
}
