import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/field_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/utils/validation.dart';

part 'profile_settings_email_bloc.freezed.dart';

part 'profile_settings_email_event.dart';
part 'profile_settings_email_command.dart';
part 'profile_settings_email_state.dart';

@injectable
class ProfileSettingsEmailBloc
    extends Bloc<ProfileSettingsEmailEvent, ProfileSettingsEmailState>
    with
        SideEffectBlocMixin<ProfileSettingsEmailState,
            ProfileSettingsEmailCommand> {
  final UserRepository _userRepository;
  final NewUserRemoteDataSource _dataSource;

  ProfileSettingsEmailBloc(
    this._userRepository,
    this._dataSource,
  ) : super(
          ProfileSettingsEmailState(
            user: _userRepository.lastCurrentUser,
            error: null,
          ),
        ) {
    on<SavePressed>(_onPressedSaveButton);
    on<CancelPressed>(_onPressedCancelButton);
    on<EmailChanged>(_onEmailChanged);
    on<Delete>(_onDeleted);
  }

  Future<void> _onPressedSaveButton(
    SavePressed event,
    Emitter<ProfileSettingsEmailState> emit,
  ) async {
    if (Validation.emailValidation(event.email) == null) {
      if (state is _ProfileSettingsEmailState) {
        final profileState = state as _ProfileSettingsEmailState;
        _userRepository.updateUser(profileState.user);
        _dataSource.updateEmailUser(
          profileState.user.token,
          FieldDto(field: profileState.user.email),
        );
        produceSideEffect(NavToBack());
      }
    } else {
      emit(state.copyWith(error: Validation.emailValidation(event.email)));
    }
  }

  void _onDeleted(
    Delete event,
    Emitter<ProfileSettingsEmailState> emit,
  ) {
    if (state is _ProfileSettingsEmailState) {
      final profileState = state as _ProfileSettingsEmailState;
      emit(profileState.copyWith(user: profileState.user.copyWith(email: '')));
    }
  }

  void _onPressedCancelButton(
    CancelPressed event,
    Emitter<ProfileSettingsEmailState> emit,
  ) {
    produceSideEffect(NavToBack());
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<ProfileSettingsEmailState> emit,
  ) {
    if (state is _ProfileSettingsEmailState) {
      final profileState = state as _ProfileSettingsEmailState;
      emit(
        profileState.copyWith(
          user: profileState.user.copyWith(email: event.email),
        ),
      );
    }
  }
}
