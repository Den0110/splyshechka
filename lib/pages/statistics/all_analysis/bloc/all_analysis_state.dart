part of 'all_analysis_bloc.dart';

@freezed
class AllAnalysisState with _$AllAnalysisState {
  const factory AllAnalysisState.initial({
    required bool loading,
    required List<SleepDto> listSleep,
  }) = _Initial;
}
