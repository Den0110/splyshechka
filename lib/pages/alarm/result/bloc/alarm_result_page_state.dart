part of 'alarm_result_page_bloc.dart';

@freezed
class AlarmResultPageState with _$AlarmResultPageState {
  const factory AlarmResultPageState.initial() = _AlarmResultPageInitial;
  const factory AlarmResultPageState.loaded({required String filePath}) = _Loaded;
}
