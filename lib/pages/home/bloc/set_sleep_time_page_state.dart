part of 'set_sleep_time_page_cubit.dart';

@Freezed(equal: false)
class SetSleepTimePageState with _$SetSleepTimePageState {
  factory SetSleepTimePageState({
    required SleepTime bedTime,
    required SleepTime wakeUpTime,
  }) = _SetSleepTimePageState;

  @Implements<OneShotState>()
  factory SetSleepTimePageState.navToWentDetails({
    required SleepTimeType initialTab,
  }) = NavToWentDetails;

  @Implements<OneShotState>()
  factory SetSleepTimePageState.navToSleep() = NavToSleep;

  @Implements<OneShotState>()
  factory SetSleepTimePageState.navToBack() = NavToBack;
}
