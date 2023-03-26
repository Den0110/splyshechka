
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_result_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_up_dto.dart';

abstract class NewUserRemoteDataSource {
 Future<void> signUpUser(SleepUserSignUpDto user);
 Future<SleepUserSignInResultDto> signInUser(SleepUserSignInDto user);
}
