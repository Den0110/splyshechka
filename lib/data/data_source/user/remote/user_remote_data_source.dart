import 'package:splyshechka/data/model/user/sleep_user_dto.dart';

abstract class UserRemoteDataSource {
  Future<SleepUserDto> fetchUser(int id);

  Future<SleepUserDto> updateUser(int id, SleepUserDto user);

  Future<void> sendEmailCode();

  Future<void> updatePassword({
    required String newPassword,
    required String code,
  });
}
