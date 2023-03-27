import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/field_dto.dart';
import 'package:splyshechka/data/model/new_user/new_sleep_user_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_up_dto.dart';
import 'package:splyshechka/data/model/new_user/token_dto.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';

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
  Future<TokenDto> signInUser(@Body() SleepUserSignInDto user);

  @override
  @GET("/user/get-user")
  Future<NewSleepUserDto> getUser(@Header("Authorization") String token);

  @override
  @POST('/user/delete')
  Future<void> deleteUser(@Header("Authorization") String token);

  @override
  @POST('/user/update-email')
  Future<void> updateEmailUser(
    @Header("Authorization") String token,
    @Body() FieldDto field,
  );

  @override
  @POST('/user/update-fullname')
  Future<void> updateFullNameUser(
    @Header("Authorization") String token,
    @Body() FieldDto field,
  );

  @override
  @POST('/user/update-gender')
  Future<void> updateGenderUser(
    @Header("Authorization") String token,
    @Body() FieldDto field,
  );

  @override
  @GET("/sleep/last")
  Future<SleepDto> getLastSleep(
    @Header("Authorization") String token,
  );

  @override
  @GET("/sleep/all")
  Future<List<SleepDto>> getAllSleep(
    @Header("Authorization") String token,
  );

  @override
  @POST("/sleep/add")
  Future<void> addSleep(
    @Header("Authorization") String token,
    @Body() SleepDto field,
  );
}
