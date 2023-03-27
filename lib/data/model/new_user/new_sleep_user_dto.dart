import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_sleep_user_dto.freezed.dart';

part 'new_sleep_user_dto.g.dart';

@freezed
class NewSleepUserDto with _$NewSleepUserDto {
  const factory NewSleepUserDto({
    required int id,
    required String username,
    required String fullName,
    required String email,
    required String gender,
  }) = _NewSleepUserDto;

  factory NewSleepUserDto.fromJson(Map<String, dynamic> json) =>
      _$NewSleepUserDtoFromJson(json);
}
