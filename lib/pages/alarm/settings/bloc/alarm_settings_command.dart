part of 'alarm_settings_bloc.dart';

@freezed
class AlarmSettingsCommand with _$AlarmSettingsCommand {
  factory AlarmSettingsCommand.navToSnooze() = NavToSnooze;
  factory AlarmSettingsCommand.navToDelay() = NavToDelay;
  factory AlarmSettingsCommand.navBack() = NavBack;
}
