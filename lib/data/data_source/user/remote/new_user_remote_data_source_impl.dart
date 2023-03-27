import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_result_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_up_dto.dart';

part 'new_user_remote_data_source_impl.g.dart';

@RestApi()
@Singleton(as: NewUserRemoteDataSource)
abstract class NewUserRemoteDataSourceImpl implements NewUserRemoteDataSource {
  @factoryMethod
  factory NewUserRemoteDataSourceImpl(Dio dio) = _NewUserRemoteDataSourceImpl;

  @override
  @POST('/api/registration/')
  Future<void> signUpUser(@Body() SleepUserSignUpDto user);

  @override
  @POST('/api/auth/login/')
  Future<SleepUserSignInResultDto> signInUser(@Body() SleepUserSignInDto user);
}
