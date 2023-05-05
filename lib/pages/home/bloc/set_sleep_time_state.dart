part of 'set_sleep_time_bloc.dart';

@freezed
class SetSleepTimeState with _$SetSleepTimeState {
   const factory SetSleepTimeState.initial({
    required SleepTime bedTime,
    required SleepTime wakeUpTime,
  }) = _Initial;
}
