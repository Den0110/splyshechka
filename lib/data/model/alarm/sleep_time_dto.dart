import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_pillow/domain/entities/alarm/sleep_time.dart';

part 'sleep_time_dto.freezed.dart';

part 'sleep_time_dto.g.dart';

@freezed
class SleepTimeDto with _$SleepTimeDto {
  const factory SleepTimeDto({required int hour, required int minute}) =
      _SleepTimeDto;

  factory SleepTimeDto.fromJson(Map<String, dynamic> json) =>
      _$SleepTimeDtoFromJson(json);
}

extension SleepTimeMapper on SleepTimeDto {
  SleepTime toModel() {
    return SleepTime(h: hour, m: minute);
  }

  static SleepTimeDto fromModel(SleepTime model) {
    return SleepTimeDto(hour: model.h, minute: model.m);
  }
}
