part of 'sleep_analysis_bloc.dart';

@freezed
class SleepAnalysisState with _$SleepAnalysisState {
  const factory SleepAnalysisState.loading() = _Loading;
  const factory SleepAnalysisState.loaded({
    required SleepTime wentToBed,
    required SleepTime asleepAfter,
    required SleepTime totalSleep,
    required SleepTime inBed,
    required SleepTime wokeUp,
    required int noise,
    required int quality,
    required List<int> chartData,
    required List<String> chartLabels,
  }) = _Loaded;
}
