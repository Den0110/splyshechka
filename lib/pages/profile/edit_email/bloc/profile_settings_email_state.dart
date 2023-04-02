part of 'profile_settings_email_bloc.dart';

@Freezed(equal: false)
class ProfileSettingsEmailState with _$ProfileSettingsEmailState {
  factory ProfileSettingsEmailState({
    required SleepUser user,
    required String? error,
  }) = _ProfileSettingsEmailState;
}
