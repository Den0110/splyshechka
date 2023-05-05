import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String headerText,
    required String description,
    required bool isAchieved,
    required String image,
    required int counter,
    required int finalCount,
  }) = _Achievement;
}
