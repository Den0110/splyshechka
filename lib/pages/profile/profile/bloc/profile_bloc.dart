import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;

  ProfileBloc(this._userRepository)
      : super(
          ProfileState(
            user: _userRepository.lastCurrentUser,
          ),
        ) {
    on<PageOpened>(_onPageOpened);
    on<SettingsPressed>(_onPressedSettingsButton);
    on<RecordsPressed>(_onPressedRecords);
    on<LogoutPressed>(_onPressedLogout);
    on<SoundChanged>(_onSoundChanged);
  }

  Future<void> _onPageOpened(
    PageOpened event,
    Emitter<ProfileState> emit,
  ) async {
    await for (final user in _userRepository.currentUser.stream) {
      if (state is _ProfileState) {
        final userState = state as _ProfileState;
        emit(userState.copyWith(user: user));
      }
    }
  }

  void _onPressedSettingsButton(
    SettingsPressed event,
    Emitter<ProfileState> emit,
  ) {
    emitOnce(emit, ProfileState.navToProfileSettings());
  }

  void _onPressedRecords(
    RecordsPressed event,
    Emitter<ProfileState> emit,
  ) {
    emitOnce(emit, ProfileState.navToRecords());
  }

  void _onPressedLogout(
    LogoutPressed event,
    Emitter<ProfileState> emit,
  ) {
    emitOnce(emit, ProfileState.logout());
  }

  void _onSoundChanged(
    SoundChanged event,
    Emitter<ProfileState> emit,
  ) {
    _userRepository.updateUser(
      _userRepository.lastCurrentUser.copyWith(sound: event.sound),
    );
  }
}
