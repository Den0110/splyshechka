part of 'alarm_sleeping_cubit.dart';

@Freezed(equal: false)
class AlarmSleepingState with _$AlarmSleepingState {
  const factory AlarmSleepingState.initial({
    required DateTime currentDate,
    required String alarmTime,
    required int currentVolume,
  }) = Initial;

  @Implements<OneShotState>()
  factory AlarmSleepingState.navToAlarm() = NavToAlarm;

  @Implements<OneShotState>()
  factory AlarmSleepingState.navToResults() = NavToResults;
}
