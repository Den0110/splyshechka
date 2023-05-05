part of 'profile_settings_password_bloc.dart';

@freezed
class ProfileSettingsPasswordEvent with _$ProfileSettingsPasswordEvent {
  const factory ProfileSettingsPasswordEvent.savePressed({
    required String code,
    required String password,
  }) = SavePressed;
  
  const factory ProfileSettingsPasswordEvent.deleteCode() = DeleteCode;
  
  const factory ProfileSettingsPasswordEvent.deletePassword() = DeletePassword;

  const factory ProfileSettingsPasswordEvent.cancelPressed() = CancelPressed;

  const factory ProfileSettingsPasswordEvent.sendCodePressed() =
      SendCodePressed;

  const factory ProfileSettingsPasswordEvent.passwordChanged({
    required String password,
  }) = PasswordChanged;

  const factory ProfileSettingsPasswordEvent.emailChanged() = EmailChanged;

  const factory ProfileSettingsPasswordEvent.emailCodeChanged({
    required String code,
  }) = EmailCodeChanged;
}
