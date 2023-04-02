part of 'profile_settings_password_bloc.dart';

@freezed
class ProfileSettingsPasswordCommand with _$ProfileSettingsPasswordCommand {
  factory ProfileSettingsPasswordCommand.navToBack() = NavToBack;
  factory ProfileSettingsPasswordCommand.error() = Error;
}
