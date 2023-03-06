import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_avatar.freezed.dart';

@freezed
class SleepAvatar with _$SleepAvatar {
  const factory SleepAvatar({
    required String emojiUrl,
    required Color color,
  }) = _SleepAvatar;
}
