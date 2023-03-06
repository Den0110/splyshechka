import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/profile/sleep_avatar.dart';

part 'sleep_avatar_dto.freezed.dart';

@freezed
class SleepAvatarDto with _$SleepAvatarDto {
  const factory SleepAvatarDto({
    required String imageUrl,
    required int color,
  }) = _SleepAvatarDto;
}

extension SleepAvatarMapper on SleepAvatarDto {
  SleepAvatar toModel() {
    return SleepAvatar(
      emojiUrl: imageUrl,
      color: Color(color),
    );
  }

  static SleepAvatarDto fromModel(SleepAvatar avatar) {
    return SleepAvatarDto(
      imageUrl: avatar.emojiUrl,
      color: avatar.color.value,
    );
  }
}
