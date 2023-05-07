part of 'sleep_analysis_bloc.dart';

@freezed
class SleepAnalysisCommand with _$SleepAnalysisCommand {
  factory SleepAnalysisCommand.openDialog({
    required int index,
  }) = OpenDialog;
}
