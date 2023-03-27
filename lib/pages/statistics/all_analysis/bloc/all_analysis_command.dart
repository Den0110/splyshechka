part of 'all_analysis_bloc.dart';

@Freezed(equal: false)
class AllAnalysisCommand with _$AllAnalysisCommand {
  const factory AllAnalysisCommand.openCard({
    required SleepDto sleep,
  }) = OpenCard;
}
