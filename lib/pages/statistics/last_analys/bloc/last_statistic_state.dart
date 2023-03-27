part of 'last_statistic_bloc.dart';

@freezed
class LastStatisticState with _$LastStatisticState {
  const factory LastStatisticState.initial({
    required bool loading,
    SleepDto? sleep,
  }) = _Initial;
}
