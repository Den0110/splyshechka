import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_dto.freezed.dart';
part 'achievement_dto.g.dart';

@freezed
class AchievementDto with _$AchievementDto {
  const factory AchievementDto({
    required String headerText,
    required String description,
    required bool isAchieved,
    required String image,
    required int counter,
    required int finalCount,
    required int index,
  }) = _AchievementDto;

    factory AchievementDto.fromJson(Map<String, dynamic> json) =>
      _$AchievementDtoFromJson(json);
}
