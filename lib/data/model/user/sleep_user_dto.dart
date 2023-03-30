import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/data/model/user/sleep_avatar_dto.dart';
import 'package:splyshechka/data/model/user/sleep_gender_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';

part 'sleep_user_dto.freezed.dart';
part 'sleep_user_dto.g.dart';

@freezed
class SleepUserDto with _$SleepUserDto {
  const factory SleepUserDto({
    required int id,
    required SleepAvatarDto avatar,
    required String nickname,
    required String fullName,
    required String email,
    required bool sound,
    required String token,
    required GenderDto gender,
  }) = _SleepUserDto;

  factory SleepUserDto.fromJson(Map<String, dynamic> json) =>
      _$SleepUserDtoFromJson(json);
}

extension SleepUserMapper on SleepUserDto {
  SleepUser toModel() {
    return SleepUser(
      id: id,
      avatar: avatar.toModel(),
      fullName: fullName,
      email: email,
      sound: sound,
      token: token,
      gender: gender.toModel(),
      nickname: nickname,
    );
  }

  static SleepUserDto fromModel(SleepUser user) {
    return SleepUserDto(
      id: user.id,
      avatar: SleepAvatarMapper.fromModel(user.avatar),
      nickname: user.nickname,
      fullName: user.fullName,
      token: user.token,
      email: user.email,
      sound: user.sound,
      gender: GenderMapper.fromModel(user.gender),
    );
  }
}
