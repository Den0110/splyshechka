part of 'profile_settings_avatar_bloc.dart';

@Freezed(equal: false)
class ProfileSettingsAvatarState with _$ProfileSettingsAvatarState {
  const factory ProfileSettingsAvatarState({
    required SleepUser user,
  }) = _ProfileSettingsAvatarState;
}
