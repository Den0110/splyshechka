import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'profile_settings_password_event.dart';
part 'profile_settings_password_state.dart';
part 'profile_settings_password_bloc.freezed.dart';

@injectable
class ProfileSettingsPasswordBloc
    extends Bloc<ProfileSettingsPasswordEvent, ProfileSettingsPasswordState> {
  final UserRepository _userRepository;

  ProfileSettingsPasswordBloc(this._userRepository)
      : super(
          _ProfileSettingsPasswordState(
            user: _userRepository.lastCurrentUser,
            state: PasswordState.initial,
            code: '',
            password: '',
          ),
        ) {
    on<SavePressed>(_onPressedSaveButton);
    on<CancelPressed>(_onPressedCancelButton);
    on<SendCodePressed>(_onPressedCodeButton);
    on<PasswordChanged>(_onPasswordChanged);
    on<EmailCodeChanged>(_onEmailCodeChanged);
  }
  void _onPressedSaveButton(
    SavePressed event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) {
    if (state is _ProfileSettingsPasswordState) {
      final profileState = state as _ProfileSettingsPasswordState;
      _userRepository.updatePassword(
        profileState.password,
        profileState.code,
      );
      emitOnce(emit, NavToBack());
    }
  }

  void _onPressedCancelButton(
    CancelPressed event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) {
    emitOnce(emit, NavToBack());
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) {
    if (state is _ProfileSettingsPasswordState) {
      final profileState = state as _ProfileSettingsPasswordState;
      emit(profileState.copyWith(password: event.password));
    }
  }

  void _onEmailCodeChanged(
    EmailCodeChanged event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) {
    if (state is _ProfileSettingsPasswordState) {
      final profileState = state as _ProfileSettingsPasswordState;
      emit(profileState.copyWith(code: event.code));
    }
  }

  Future<void> _onPressedCodeButton(
    SendCodePressed event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) async {
    await _userRepository.sendEmailCode();
    if (state is _ProfileSettingsPasswordState) {
      final profileState = state as _ProfileSettingsPasswordState;
      emit(
        profileState.copyWith(
          state: PasswordState.codeSent,
        ),
      );
    }
  }
}
