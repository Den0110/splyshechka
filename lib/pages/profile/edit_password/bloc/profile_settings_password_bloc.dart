import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/non_reset_password_dto.dart';
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
  final NewUserRemoteDataSource _dataSource;

  ProfileSettingsPasswordBloc(
    this._userRepository,
    this._dataSource,
  ) : super(
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
  Future<void> _onPressedSaveButton(
    SavePressed event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) async {
    try {
      if (state is _ProfileSettingsPasswordState) {
        final profileState = state as _ProfileSettingsPasswordState;
        await _dataSource.resetPassword(
          profileState.user.token,
          NonResetPasswordDto(
            resetCode: event.code,
            newPassword: event.password,
          ),
        );
        _userRepository.updatePassword(
          event.password,
          event.code,
        );
        emitOnce(emit, NavToBack());
      }
    } catch (e) {
      emitOnce(emit, Error());
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
    if (state is _ProfileSettingsPasswordState) {
      final profileState = state as _ProfileSettingsPasswordState;
      await _dataSource.sendCodeEmail(profileState.user.token);
      emit(
        profileState.copyWith(
          state: PasswordState.codeSent,
        ),
      );
    }
  }
}
