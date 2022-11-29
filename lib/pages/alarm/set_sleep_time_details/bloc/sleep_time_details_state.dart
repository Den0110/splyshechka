part of 'sleep_time_details_cubit.dart';

@freezed
class SleepTimeDetailsState with _$SleepTimeDetailsState {
  const factory SleepTimeDetailsState.initial({
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

  @Implements<OneShotState>()
  factory SleepTimeDetailsState.navToSnooze() = NavToSnooze;

  @Implements<OneShotState>()
  factory SleepTimeDetailsState.navBack() = NavBack;
}
