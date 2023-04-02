import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/non_reset_password_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/utils/validation.dart';

part 'profile_settings_password_event.dart';
part 'profile_settings_password_state.dart';
part 'profile_settings_password_command.dart';
part 'profile_settings_password_bloc.freezed.dart';

@injectable
class ProfileSettingsPasswordBloc
    extends Bloc<ProfileSettingsPasswordEvent, ProfileSettingsPasswordState>
    with
        SideEffectBlocMixin<ProfileSettingsPasswordState,
            ProfileSettingsPasswordCommand> {
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
              wrongPassword: null,
              wrongCode: null),
        ) {
    on<SavePressed>(_onPressedSaveButton);
    on<CancelPressed>(_onPressedCancelButton);
    on<SendCodePressed>(_onPressedCodeButton);
    on<PasswordChanged>(_onPasswordChanged);
    on<EmailCodeChanged>(_onEmailCodeChanged);
    on<DeleteCode>(_onDeletedCode);
    on<DeletePassword>(_onDeletedPassword);
  }
  Future<void> _onPressedSaveButton(
    SavePressed event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) async {
    if (Validation.passwordValidation(event.password) == null &&
        Validation.codeValidation(event.code) == null) {
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
          produceSideEffect(NavToBack());
        }
      } catch (e) {
        print(e);
        produceSideEffect(Error());
      }
    } else {
      emit(state.copyWith(
          wrongPassword: Validation.passwordValidation(event.password),
          wrongCode: Validation.notNull(event.code)));
    }
  }

  void _onPressedCancelButton(
    CancelPressed event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) {
    produceSideEffect(NavToBack());
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

  void _onDeletedCode(
    DeleteCode event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) {
    if (state is _ProfileSettingsPasswordState) {
      final profileState = state as _ProfileSettingsPasswordState;
      emit(profileState.copyWith(code: ''));
    }
  }

  void _onDeletedPassword(
    DeletePassword event,
    Emitter<ProfileSettingsPasswordState> emit,
  ) {
    if (state is _ProfileSettingsPasswordState) {
      final profileState = state as _ProfileSettingsPasswordState;
      emit(profileState.copyWith(password: ''));
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
