
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'profile_settings_name_event.dart';
part 'profile_settings_name_state.dart';
part 'profile_settings_name_bloc.freezed.dart';

@injectable
class ProfileSettingsNameBloc
    extends Bloc<ProfileSettingsNameEvent, ProfileSettingsNameState> {
  final UserRepository _userRepository;
  
  ProfileSettingsNameBloc(this._userRepository)
      : super(
          ProfileSettingsNameState(
            user: _userRepository.lastCurrentUser,
          ),
        ) {
    on<SavePressed>(_onPressedSaveButton);
    on<CancelPressed>(_onPressedCancelButton);
    on<NameChanged>(_onNameChanged);
  }
  void _onPressedSaveButton(
    SavePressed event,
    Emitter<ProfileSettingsNameState> emit,
  ) {
    if (state is _ProfileSettingsNameState) {
      final profileState = state as _ProfileSettingsNameState;
      _userRepository.updateUser(profileState.user);
      emitOnce(emit, NavToBack());
    }
  }

  void _onPressedCancelButton(
    CancelPressed event,
    Emitter<ProfileSettingsNameState> emit,
  ) {
    emitOnce(emit, NavToBack());
  }

  void _onNameChanged(
    NameChanged event,
    Emitter<ProfileSettingsNameState> emit,
  ) {
    if (state is _ProfileSettingsNameState) {
      final profileState = state as _ProfileSettingsNameState;
      emit(profileState.copyWith(
        user: profileState.user.copyWith(name: event.name),
      ));
    }
  }
}
