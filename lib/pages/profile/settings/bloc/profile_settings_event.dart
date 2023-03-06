part of 'profile_settings_bloc.dart';

@freezed
class ProfileSettingsEvent with _$ProfileSettingsEvent {
  const factory ProfileSettingsEvent.pageOpened() = PageOpened;

  const factory ProfileSettingsEvent.avatarEditPressed() = AvatarEditPressed;

  factory ProfileSettingsEvent.emailEditPressed() = EmailEditPressed;

  factory ProfileSettingsEvent.nameEditPressed() = NameEditPressed;

  factory ProfileSettingsEvent.passwordEditPressed() = PasswordEditPressed;

  factory ProfileSettingsEvent.genderEditPressed() = GenderEditPressed;

  factory ProfileSettingsEvent.deleteAccountPressed() = DeleteAccountPressed;
}
