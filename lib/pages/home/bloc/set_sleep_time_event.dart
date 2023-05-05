part of 'set_sleep_time_bloc.dart';

@freezed
class SetSleepTimeEvent with _$SetSleepTimeEvent {
  const factory SetSleepTimeEvent.started() = Started;
  const factory SetSleepTimeEvent.cancelClicked() = _CancelClicked;
  const factory SetSleepTimeEvent.sleepClicked() = _SleepClicked;
  const factory SetSleepTimeEvent.timeChanged({
    required SleepTime bedTime,
    required SleepTime wakeUpTime,
  }) = _TimeChanged;
  const factory SetSleepTimeEvent.editRequested({
    required SleepTimeType initialTab,
  }) = _EditRequested;
}
