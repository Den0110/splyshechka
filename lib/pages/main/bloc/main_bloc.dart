import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/new_sleep_user_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_avatar.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/models/gender/gender.dart';
import 'package:splyshechka/domain/models/pickers/face_picker_items.dart';
import 'package:splyshechka/domain/models/pickers/sleep_color_picker_items.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

part 'main_bloc.freezed.dart';

part 'main_event.dart';
part 'main_command.dart';
part 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState>
    with SideEffectBlocMixin<MainState, MainCommand> {
  final UserRepository _userRepository;
  final NewUserRemoteDataSource _dataSource;
  MainBloc(this._userRepository, this._dataSource)
      : super(
          MainState.pageOpen(user: _userRepository.lastCurrentUser),
        ) {
    on<AvatarClicked>(_onAvatarClicked);
    on<PageOpened>(_onPageOpened);
  }

  void _onAvatarClicked(event, emit) {
    produceSideEffect(MainCommand.navToProfile());
  }

  void _onPageOpened(
    PageOpened event,
    Emitter<MainState> emit,
  ) async {
    String token = _userRepository.currentUser.value.token; 
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
    await for (final user in _userRepository.currentUser.stream) {
      if (state is PageOpen) {
        final userState = state as PageOpen;
        emit(userState.copyWith(user: user));
      }
      emit(MainState.pageOpen(
        user: _userRepository.lastCurrentUser,
      ));
    }
  }
}
