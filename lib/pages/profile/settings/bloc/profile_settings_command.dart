part of 'profile_settings_bloc.dart';

@freezed
class ProfileSettingsCommand with _$ProfileSettingsCommand {
  factory ProfileSettingsCommand.navToSettingsAvatar() = NavToSettingsAvatar;
  factory ProfileSettingsCommand.navToSettingsEmail() = NavToSettingsEmail;
  factory ProfileSettingsCommand.navToSettingsName() = NavToSettingsName;
  factory ProfileSettingsCommand.navToSettingsPassword() = NavToSettingsPassword;
  factory ProfileSettingsCommand.navToSettingsGender() = NavToSettingsGender;
  factory ProfileSettingsCommand.navToDeleteAccount() = NavToDeleteAccount;
}
