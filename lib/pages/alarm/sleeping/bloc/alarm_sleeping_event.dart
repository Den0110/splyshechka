part of 'alarm_sleeping_bloc.dart';

@freezed
class AlarmSleepingEvent with _$AlarmSleepingEvent {
  const factory AlarmSleepingEvent.started() = _Started;
}