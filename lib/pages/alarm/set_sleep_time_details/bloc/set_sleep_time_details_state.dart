part of 'set_sleep_time_details_bloc.dart';

@freezed
class SetSleepTimeDetailsState with _$SetSleepTimeDetailsState {
    const factory SetSleepTimeDetailsState.initial({
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
