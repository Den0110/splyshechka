part of 'achievement_bloc.dart';

@freezed
class AchievementEvent with _$AchievementEvent {
  const factory AchievementEvent.started() = _Started;
  const factory AchievementEvent.pageChanged({
    required int index,
  }) = PageChanged;
}
