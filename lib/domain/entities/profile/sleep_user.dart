import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/entities/profile/sleep_avatar.dart';
import 'package:splyshechka/models/gender/gender.dart';

part 'sleep_user.freezed.dart';

@freezed
class SleepUser with _$SleepUser {
  const factory SleepUser({
    required int token,
    required SleepAvatar avatar,
    required String name,
    required String email,
    required bool sound,
    required Gender gender,
  }) = _SleepUser;
}
