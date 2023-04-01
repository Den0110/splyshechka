part of 'set_sleep_time_details_bloc.dart';

@freezed
class SetSleepTimeDetailsEvent with _$SetSleepTimeDetailsEvent {
  const factory SetSleepTimeDetailsEvent.pageOpened(
      {required SleepTimeType sleepTimeType}) = PageOpened;
  const factory SetSleepTimeDetailsEvent.started() = Started;
}