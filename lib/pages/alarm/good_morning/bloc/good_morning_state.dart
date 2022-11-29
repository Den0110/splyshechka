part of 'good_morning_bloc.dart';

@Freezed(equal: false)
class GoodMorningState with _$GoodMorningState {
  const factory GoodMorningState.initial({required DateTime dateTime}) = Initial;
  @Implements<OneShotState>()
  factory GoodMorningState.delay() = Delay;
  @Implements<OneShotState>()
  factory GoodMorningState.wakeUp() = WakeUp;
}

