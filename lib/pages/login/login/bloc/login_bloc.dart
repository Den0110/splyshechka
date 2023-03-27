import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_result_dto.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_command.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState>
    with SideEffectBlocMixin<LoginState, LoginCommand> {
  final NewUserRemoteDataSource _dataSource;
  LoginBloc(this._dataSource) : super(_Initial()) {
    on<_SignInClicked>(_onSignInClicked);
  }

  Future<void> _onSignInClicked(
    _SignInClicked event,
    Emitter<LoginState> emit,
  ) async {
    try {
      SleepUserSignInResultDto result =
          await _dataSource.signInUser(SleepUserSignInDto(
        username: event.email,
        password: event.password,
      ));
      String token = result.token;
      produceSideEffect(LoginCommand.navToMain());
    } catch (e) {
      produceSideEffect(LoginCommand.error());
    }

    //Получение юзера по токену
  }
}
