
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/data/model/user/sleep_avatar_dto.dart';
import 'package:splyshechka/data/model/user/sleep_gender_dto.dart';
import 'package:splyshechka/domain/profile/sleep_user.dart';

part 'sleep_user_dto.freezed.dart';

@freezed
class SleepUserDto with _$SleepUserDto {
  const factory SleepUserDto({
    required int id,
    required SleepAvatarDto avatar,
    required String name,
    required String email,
    required bool sound,
    required GenderDto gender,
  }) = _SleepUserDto;
}

extension SleepUserMapper on SleepUserDto {
  SleepUser toModel() {
    return SleepUser(
      id: id,
      avatar: avatar.toModel(),
      name: name,
      email: email,
      sound: sound,
      gender: gender.toModel(),
    );
  }

  static SleepUserDto fromModel(SleepUser user) {
    return SleepUserDto(
      id: user.id,
      avatar: SleepAvatarMapper.fromModel(user.avatar),
      name: user.name,
      email: user.email,
      sound: user.sound,
      gender: GenderMapper.fromModel(user.gender),
    );
  }
}
