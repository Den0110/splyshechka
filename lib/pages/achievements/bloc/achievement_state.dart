part of 'achievement_bloc.dart';

@freezed
class AchievementState with _$AchievementState {
  const factory AchievementState.initial({
    required bool loading,
    required int selectedPage,
    required List<AchievementDto> listReady,
    required List<AchievementDto> listUnready,
    required bool wasOpened,
  }) = _Initial;
}
