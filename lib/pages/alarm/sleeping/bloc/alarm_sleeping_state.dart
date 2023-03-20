part of 'alarm_sleeping_bloc.dart';

@freezed
class AlarmSleepingState with _$AlarmSleepingState {
  const factory AlarmSleepingState.initial({
    required DateTime currentDate,
    required String alarmTime,
    required int currentVolume,
  }) = _Initial;
}
