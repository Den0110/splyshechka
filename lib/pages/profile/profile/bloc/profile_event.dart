part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.pageOpened() = PageOpened;
  const factory ProfileEvent.settingsPressed() = SettingsPressed;
  const factory ProfileEvent.recordsPressed() = RecordsPressed;
  const factory ProfileEvent.logoutPressed() = LogoutPressed;
  const factory ProfileEvent.soundChanged({
    required bool sound,
  }) = SoundChanged;
}
