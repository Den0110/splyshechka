part of 'profile_settings_email_bloc.dart';

@freezed
class ProfileSettingsEmailEvent with _$ProfileSettingsEmailEvent {
  const factory ProfileSettingsEmailEvent.savePressed({
    required String email,
  }) = SavePressed;

  const factory ProfileSettingsEmailEvent.cancelPressed() = CancelPressed;
  const factory ProfileSettingsEmailEvent.delete() = Delete;

  const factory ProfileSettingsEmailEvent.emailChanged(
      {required String email}) = EmailChanged;
}
