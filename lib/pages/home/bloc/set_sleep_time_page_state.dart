part of 'set_sleep_time_page_cubit.dart';

@Freezed(equal: false)
class SetSleepTimePageState with _$SetSleepTimePageState {
  factory SetSleepTimePageState({
    required SleepTime bedTime,
    required SleepTime wakeUpTime,
  }) = _SetSleepTimePageState;

  @Implements<OneShotState>()
  factory SetSleepTimePageState.navToDetails({
    required SleepTimeType initialTab,
  }) = NavToDetails;

  @Implements<OneShotState>()
  factory SetSleepTimePageState.navToSleep() = NavToSleep;

  @Implements<OneShotState>()
  factory SetSleepTimePageState.navToBack() = NavToBack;
}
