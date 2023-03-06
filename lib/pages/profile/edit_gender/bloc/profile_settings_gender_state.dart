part of 'profile_settings_gender_bloc.dart';

@Freezed(equal: false)
class ProfileSettingsGenderState with _$ProfileSettingsGenderState {
  const factory ProfileSettingsGenderState({
    required SleepUser user,
  }) = _ProfileSettingsGenderState;

  @Implements<OneShotState>()
  factory ProfileSettingsGenderState.navToBack() = NavToBack;
}
