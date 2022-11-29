part of 'good_morning_bloc.dart';

@Freezed(equal: false)
class GoodMorningEvent with _$GoodMorningEvent {
  const factory GoodMorningEvent.delay() = Delayed;
  const factory GoodMorningEvent.wokeUp() = WokeUp;
}
