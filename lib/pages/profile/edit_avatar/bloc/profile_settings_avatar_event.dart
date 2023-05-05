part of 'profile_settings_avatar_bloc.dart';

@freezed
class ProfileSettingsAvatarEvent with _$ProfileSettingsAvatarEvent {
  const factory ProfileSettingsAvatarEvent.colorChanged({
    required Color color,
  }) = ColorChanged;

  const factory ProfileSettingsAvatarEvent.faceChanged({
    required String face,
  }) = FaceChanged;
}
