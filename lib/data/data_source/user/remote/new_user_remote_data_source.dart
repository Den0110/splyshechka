import 'package:splyshechka/data/model/new_user/field_avatar_dto.dart';
import 'package:splyshechka/data/model/new_user/field_dto.dart';
import 'package:splyshechka/data/model/new_user/new_sleep_user_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_email_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_up_dto.dart';
import 'package:splyshechka/data/model/new_user/token_dto.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';

abstract class NewUserRemoteDataSource {
  Future<void> signUpUser(SleepUserSignUpDto user);
  Future<TokenDto> signInUser(SleepUserSignInDto user);
  Future<TokenDto> signInEmailUser(SleepUserSignInEmailDto user);
  Future<NewSleepUserDto> getUser(String token);
  Future<void> deleteUser(String token);
  Future<void> updateEmailUser(
    String token,
    FieldDto field,
  );
  Future<void> updateFullNameUser(
    String token,
    FieldDto field,
  );
  Future<void> updateGenderUser(
    String token,
    FieldDto field,
  );
  Future<void> updateColorUser(
    String token,
    FieldAvatarDto field,
  );
  Future<void> updateImageUser(
    String token,
    FieldAvatarDto field,
  );
  Future<SleepDto> getLastSleep(String token);
  Future<List<SleepDto>> getAllSleep(String token);
  Future<void> addSleep(
    String token,
    SleepDto field,
  );
}
