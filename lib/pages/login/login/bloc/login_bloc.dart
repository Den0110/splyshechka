import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/new_sleep_user_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_dto.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_in_email_dto.dart';
import 'package:splyshechka/data/model/new_user/token_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_avatar.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/models/gender/gender.dart';
import 'package:splyshechka/domain/models/pickers/face_picker_items.dart';
import 'package:splyshechka/domain/models/pickers/sleep_color_picker_items.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

part 'login_bloc.freezed.dart';
part 'login_command.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState>
    with SideEffectBlocMixin<LoginState, LoginCommand> {
  final NewUserRemoteDataSource _dataSource;
  final UserRepository _userRepository;

  LoginBloc(
    this._dataSource,
    this._userRepository,
  ) : super(const Initial(
          loading: true,
        )) {
    on<Started>(_onStarted);
    on<SignInClicked>(_onSignInClicked);
    on<SignInEmailClicked>(_onSignInEmailClicked);
  }

  Future<void> _onStarted(
    Started event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final currentUser = await _userRepository.userFromLocal();
    if (currentUser != null) {
      try {
        NewSleepUserDto userDto = await _dataSource.getUser(currentUser.token);
        _userRepository.updateUser(
          SleepUser(
            nickname: userDto.username,
            fullName: userDto.fullName,
            email: userDto.email,
            gender: GenderExtension.fromJson(userDto.gender),
            id: userDto.id,
            token: currentUser.token,
            avatar: SleepAvatar(
              emojiUrl: facePickerItems[userDto.image],
              color: sleepColorPickerItems[userDto.color],
            ),
            sound: currentUser.sound,
          ),
        );
        produceSideEffect(LoginCommand.navToMain());
      } catch (e) {
        emit(state.copyWith(loading: false));
      }
    } else {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> _onSignInClicked(
    SignInClicked event,
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
          avatar: SleepAvatar(
            emojiUrl: facePickerItems[userDto.image],
            color: sleepColorPickerItems[userDto.color],
          ),
          sound: true,
        ),
      );
      produceSideEffect(LoginCommand.navToMain());
    } catch (e) {
      produceSideEffect(LoginCommand.error());
    }
  }

  Future<void> _onSignInEmailClicked(
    SignInEmailClicked event,
    Emitter<LoginState> emit,
  ) async {
    try {
      TokenDto result =
          await _dataSource.signInEmailUser(SleepUserSignInEmailDto(
        email: event.email,
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
          avatar: SleepAvatar(
            emojiUrl: facePickerItems[userDto.image],
            color: sleepColorPickerItems[userDto.color],
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
