
import 'package:splyshechka/data/model/new_user/new_sleep_user_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_up_dto.dart';
import 'package:splyshechka/data/model/new_user/token_dto.dart';

abstract class NewUserRemoteDataSource {
 Future<void> signUpUser(SleepUserSignUpDto user);
 Future<TokenDto> signInUser(SleepUserSignInDto user);
 Future<NewSleepUserDto> getUser(String token);
}
