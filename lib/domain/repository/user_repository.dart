import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:splyshechka/domain/profile/sleep_avatar.dart';
import 'package:splyshechka/domain/profile/sleep_user.dart';
import 'package:splyshechka/models/gender/gender.dart';

abstract class UserRepository {
  final currentUser = BehaviorSubject<SleepUser>();

  SleepUser get lastCurrentUser =>
      currentUser.valueOrNull ??
      SleepUser(
        id: -1,
        avatar: SleepAvatar(
          emojiUrl:
              'https://drive.google.com/uc?export=view&id=1gnHBRgL1gV0Q7ewRt8bywXeVVF4M_Fmu',
          color: Colors.white,
        ),
        name: '',
        email: '',
        sound: false,
        gender: Gender.secret,
      );

  Future<void> updateUser(SleepUser user);
  Future<void> sendEmailCode();
  Future<void> updatePassword(String password, String code);
}
