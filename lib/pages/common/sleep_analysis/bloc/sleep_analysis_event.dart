part of 'sleep_analysis_bloc.dart';

@freezed
class SleepAnalysisEvent with _$SleepAnalysisEvent {
  const factory SleepAnalysisEvent.started(String filePath) = Started;
  const factory SleepAnalysisEvent.pushed() = Pushed;
}
