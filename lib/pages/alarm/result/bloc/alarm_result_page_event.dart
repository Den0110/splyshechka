part of 'alarm_result_page_bloc.dart';

@Freezed(equal: false)
class AlarmResultPageEvent with _$AlarmResultPageEvent {
  const factory AlarmResultPageEvent.loadStarted() = LoadStarted;
}
