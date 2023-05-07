import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splyshechka/data/data_source/user/remote/user_remote_data_source.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';
import 'package:splyshechka/data/model/user/sleep_user_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/pref_ext.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  final SharedPreferences _prefs;

  UserRepositoryImpl(this._remoteDataSource, this._prefs) {
    fetchUser();
  }

  Future<void> fetchUser() async {
    final user = _prefs.getObject("user", SleepUserDto.fromJson)?.toModel();
    print(user);
    if (user != null) {
      currentUser.add(user);
    }
  }

  @override
  Future<void> updateUser(SleepUser user) async {
    currentUser.add(user);
    _prefs.setObject("user", SleepUserMapper.fromModel(user));
  }

  @override
  Future<void> updateSleepDto(bool sleepDto) async {
    sleepDtoStream.add(sleepDto);
  }

  @override
  Future<void> sendEmailCode() async {
    await _remoteDataSource.sendEmailCode();
  }

  @override
  Future<void> updatePassword(String password, String code) async {}

  @override
  Future<SleepUser?> userFromLocal() async {
    return _prefs.getObject("user", SleepUserDto.fromJson)?.toModel();
  }

   @override
  Future<bool> userDeleteFromLocal() async {
    return await _prefs.remove("user");
  }
  
  @override
  void setUser(SleepUser user) {
   _prefs.setObject("user", SleepUserMapper.fromModel(user));
  }
}
