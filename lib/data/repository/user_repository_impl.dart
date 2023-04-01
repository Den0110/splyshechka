import 'package:injectable/injectable.dart';
import 'package:splyshechka/data/data_source/user/remote/user_remote_data_source.dart';
import 'package:splyshechka/data/model/user/sleep_user_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource) {
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    final user = (await _remoteDataSource.fetchUser(111)).toModel();
    currentUser.add(user);
  }

  @override
  Future<void> updateUser(SleepUser user) async {
    currentUser.add(user);
  }

  @override
  Future<void> sendEmailCode() async {
    await _remoteDataSource.sendEmailCode();
  }

  @override
  Future<void> updatePassword(String password, String code) async {
  }
}
