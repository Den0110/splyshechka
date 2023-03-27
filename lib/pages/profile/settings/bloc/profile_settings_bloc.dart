import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

part 'profile_settings_bloc.freezed.dart';
part 'profile_settings_event.dart';
part 'profile_settings_command.dart';
part 'profile_settings_state.dart';

@injectable
class ProfileSettingsBloc
    extends Bloc<ProfileSettingsEvent, ProfileSettingsState> 
    with SideEffectBlocMixin<ProfileSettingsState, ProfileSettingsCommand>{
  final UserRepository _userRepository;
  final NewUserRemoteDataSource _dataSource;
  
  ProfileSettingsBloc(this._userRepository, this._dataSource)
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
    produceSideEffect(ProfileSettingsCommand.navToSettingsAvatar());
  }

  void _onPressedEditEmail(
    EmailEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    produceSideEffect(ProfileSettingsCommand.navToSettingsEmail());
  }

  void _onPressedEditName(
    NameEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    produceSideEffect(ProfileSettingsCommand.navToSettingsName());
  }

  void _onPressedEditPassword(
    PasswordEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    produceSideEffect(ProfileSettingsCommand.navToSettingsPassword());
  }

  void _onPressedEditGender(
    GenderEditPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    produceSideEffect(ProfileSettingsCommand.navToSettingsGender());
  }

  void _onPressedDeleteAccount(
    DeleteAccountPressed event,
    Emitter<ProfileSettingsState> emit,
  ) {
    _dataSource.deleteUser(state.user.token);
    produceSideEffect(ProfileSettingsCommand.navToDeleteAccount());
  }
}
