part of 'alarm_settings_bloc.dart';

@freezed
class AlarmSettingsEvent with _$AlarmSettingsEvent {
  const factory AlarmSettingsEvent.started() = _Started;
}