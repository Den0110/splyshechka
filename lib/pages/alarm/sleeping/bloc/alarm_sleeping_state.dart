part of 'alarm_sleeping_bloc.dart';

@freezed
class AlarmSleepingState with _$AlarmSleepingState {
  const factory AlarmSleepingState({
    required DateTime currentDate,
    required String alarmTime,
    required double visualVolume,
    required int volume,
  }) = _AlarmSleepingState;
}
