import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:splyshechka/domain/entities/profile/sleep_avatar.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/models/gender/gender.dart';

abstract class UserRepository {
  final currentUser = BehaviorSubject<SleepUser>();
  final sleepDtoStream = BehaviorSubject<bool>();

  SleepUser get lastCurrentUser =>
      currentUser.valueOrNull ??
      const SleepUser(
        id: -1,
        avatar: SleepAvatar(
          emojiUrl:
              'https://drive.google.com/uc?export=view&id=1gnHBRgL1gV0Q7ewRt8bywXeVVF4M_Fmu',
          color: Colors.white,
        ),
        nickname: "",
        fullName: '',
        email: '',
        sound: false,
        gender: Gender.male,
        token: "",
      );

  Future<void> updateUser(SleepUser user);
  Future<void> updateSleepDto(bool sleepDto);
  Future<void> sendEmailCode();
  Future<void> updatePassword(String password, String code);
  Future<SleepUser?> userFromLocal();
  Future<bool> userDeleteFromLocal();
}
