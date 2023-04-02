import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_dto.freezed.dart';
part 'sleep_dto.g.dart';

@freezed
class SleepDto with _$SleepDto {
  const factory SleepDto({
    required int noise,
    required int quality,
    required DateTime went_sleep,
    required DateTime waked_up_at,
    required double slept_during,
    required int fell_asleep_during,
    required double time_spent_in_bed
  }) = _SleepDto;

  factory SleepDto.fromJson(Map<String, dynamic> json) =>
      _$SleepDtoFromJson(json);
}
