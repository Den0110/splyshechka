import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/achievement/index_dto.dart';
import 'package:splyshechka/data/model/new_user/field_avatar_dto.dart';
import 'package:splyshechka/data/model/new_user/field_dto.dart';
import 'package:splyshechka/data/model/new_user/new_sleep_user_dto.dart';
import 'package:splyshechka/data/model/new_user/non_reset_password_dto.dart';
import 'package:splyshechka/data/model/new_user/non_send_email_code_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_email_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_up_dto.dart';
import 'package:splyshechka/data/model/new_user/token_dto.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';
import 'package:splyshechka/data/model/achievement/achievement_dto.dart';

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
  @POST('/api/auth/email-login')
  Future<TokenDto> signInEmailUser(@Body() SleepUserSignInEmailDto user);

  @override
  @GET("/user/get-user")
  Future<NewSleepUserDto> getUser(@Header("Authorization") String token);

  @override
  @POST('/non-auth-email/send-non-auth-code')
  Future<void> nonSendEmailCode(@Body() NonSendEmailCodeDto emailCodeDto);

  @override
  @POST('/non-auth-email/confirm-non-auth-reset-code')
  Future<void> nonResetPassword(@Body() NonResetPasswordDto resetPasswordDto);

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
  @POST('/user/update-color')
  Future<void> updateColorUser(
    @Header("Authorization") String token,
    @Body() FieldAvatarDto field,
  );

  @override
  @POST('/user/update-image')
  Future<void> updateImageUser(
    @Header("Authorization") String token,
    @Body() FieldAvatarDto field,
  );

  @override
  @POST('/email/send-reset-code')
  Future<void> sendCodeEmail(
    @Header("Authorization") String token,
  );

  @override
  @POST('/email/confirm-reset-code')
  Future<void> resetPassword(
    @Header("Authorization") String token,
    @Body() NonResetPasswordDto resetPasswordDto
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

  @override
  @GET("/achievement/all")
  Future<List<AchievementDto>> getAllAchievements(
    @Header("Authorization") String token,
  );

  @override
  @POST("/achievement/update")
  Future<bool> updateAchievement(
    @Header("Authorization") String token,
    @Body() IndexDto index,
  );
}
