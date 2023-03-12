import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'profile_settings_bloc.freezed.dart';

part 'profile_settings_event.dart';

part 'profile_settings_state.dart';

@injectable
class ProfileSettingsBloc
    extends Bloc<ProfileSettingsEvent, ProfileSettingsState> {
  final UserRepository _userRepository;

  ProfileSettingsBloc(this._userRepository)
      : super(
          ProfileSettingsState(
            user: _userRepository.lastCurrentUser,
          ),
        ) {
    on<PageOpened>(_onPageOpened);
    on<AvatarEditPressed>(_onPressedEditAvatar);
    on<EmailEditPressed>(_onPressedEditEmail);
    on<NameEditPressed>(_onPressedEditName);
    on<PasswordEditPressed>(_onPressedEditPassword);
    on<GenderEditPressed>(_onPressedEditGender);
    on<DeleteAccountPressed>(_onPressedDeleteAccount);
  }

  Future<void> _onPageOpened(
    PageOpened event,
    Emitter<ProfileSettingsState> emit,
  ) async {
    await for (final user in _userRepository.currentUser.stream) {
      if (state is _ProfileSettingsState) {
        final userState = state as _ProfileSettingsState;
        emit(userState.copyWith(user: user));
      }
    }
  }

  void _onPressedEditAvatar(
    AvatarEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    emitOnce(emit, NavToSettingsAvatar());
  }

  void _onPressedEditEmail(
    EmailEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    emitOnce(emit, NavToSettingsEmail());
  }

  void _onPressedEditName(
    NameEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    emitOnce(emit, NavToSettingsName());
  }

  void _onPressedEditPassword(
    PasswordEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    emitOnce(emit, NavToSettingsPassword());
  }

  void _onPressedEditGender(
    GenderEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    emitOnce(emit, NavToSettingsGender());
  }

  void _onPressedDeleteAccount(
    DeleteAccountPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    emitOnce(emit, NavToDeleteAccount());
  }
}
