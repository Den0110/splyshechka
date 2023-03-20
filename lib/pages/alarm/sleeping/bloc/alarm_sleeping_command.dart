part of 'alarm_sleeping_bloc.dart';

@freezed
class AlarmSleepingCommand with _$AlarmSleepingCommand {
  factory AlarmSleepingCommand.navToAlarm() = NavToAlarm;
  factory AlarmSleepingCommand.navToResults() = NavToResults;
}
