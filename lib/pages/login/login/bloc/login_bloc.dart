import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/new_sleep_user_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/token_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_avatar.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/models/gender/gender.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_command.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState>
    with SideEffectBlocMixin<LoginState, LoginCommand> {
  final NewUserRemoteDataSource _dataSource;
  final UserRepository _userRepository;
  LoginBloc(
    this._dataSource,
    this._userRepository,
  ) : super(_Initial()) {
    on<_SignInClicked>(_onSignInClicked);
  }

  Future<void> _onSignInClicked(
    _SignInClicked event,
    Emitter<LoginState> emit,
  ) async {
    try {
      TokenDto result = await _dataSource.signInUser(SleepUserSignInDto(
        username: event.email,
        password: event.password,
      ));
      String token = "Bearer_" + result.token;
      NewSleepUserDto userDto = await _dataSource.getUser(token);
      _userRepository.updateUser(
        SleepUser(
          nickname: userDto.username,
          fullName: userDto.fullName,
          email: userDto.email,
          gender: GenderExtension.fromJson(userDto.gender),
          id: userDto.id,
          token: token,
          avatar: const SleepAvatar(
            emojiUrl:
                'https://drive.google.com/uc?export=view&id=1gnHBRgL1gV0Q7ewRt8bywXeVVF4M_Fmu',
            color: Colors.white,
          ),
          sound: true,
        ),
      );
      produceSideEffect(LoginCommand.navToMain());
    } catch (e) {
      produceSideEffect(LoginCommand.error());
    }
  }
}
