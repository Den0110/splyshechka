part of 'profile_settings_name_bloc.dart';

@Freezed(equal: false)
class ProfileSettingsNameState with _$ProfileSettingsNameState {
  factory ProfileSettingsNameState({
    required SleepUser user,
    required String? error,
  }) = _ProfileSettingsNameState;
}
