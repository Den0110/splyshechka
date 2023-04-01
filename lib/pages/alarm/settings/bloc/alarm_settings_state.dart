part of 'alarm_settings_bloc.dart';

@freezed
class AlarmSettingsState with _$AlarmSettingsState {
  const factory AlarmSettingsState.initial({
    required SleepTime bedtime,
    required SleepTime wakeupTime,
    required bool remindToSleep,
    required bool alarmEnabled,
    required bool vibrationEnabled,
    required double alarmVolume,
    required SnoozeTime snoozeTime,
    required SleepTime sleepGoal,
    required SleepTimeType selectedTab,
  }) = Initial;
}
