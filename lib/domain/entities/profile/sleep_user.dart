import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/entities/profile/sleep_avatar.dart';
import 'package:splyshechka/domain/models/gender/gender.dart';


part 'sleep_user.freezed.dart';

@freezed
class SleepUser with _$SleepUser {
  const factory SleepUser({
    required int id,
    required SleepAvatar avatar,
    required String nickname,
    required String fullName,
    required String email,
    required bool sound,
    required Gender gender,
    required String token,
  }) = _SleepUser;
}
