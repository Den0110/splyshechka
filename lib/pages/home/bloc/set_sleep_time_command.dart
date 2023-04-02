part of 'set_sleep_time_bloc.dart';

@freezed
class SetSleepTimeCommand with _$SetSleepTimeCommand {
  factory SetSleepTimeCommand.navToWentDetails({
    required SleepTimeType initialTab,
  }) = NavToWentDetails;

  factory SetSleepTimeCommand.navToSleep() = NavToSleep;

  factory SetSleepTimeCommand.navToBack() = NavToBack;
}