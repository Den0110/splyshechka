part of 'profile_settings_bloc.dart';

@Freezed(equal:false)
class ProfileSettingsState with _$ProfileSettingsState {

  const factory ProfileSettingsState({
    required SleepUser user,
  }) = _ProfileSettingsState;
}
