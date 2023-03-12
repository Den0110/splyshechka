import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/models/gender/gender.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
part 'profile_settings_gender_event.dart';
part 'profile_settings_gender_state.dart';
part 'profile_settings_gender_bloc.freezed.dart';

@injectable
class ProfileSettingsGenderBloc
    extends Bloc<ProfileSettingsGenderEvent, ProfileSettingsGenderState> {
  final UserRepository _userRepository;
  
  ProfileSettingsGenderBloc(this._userRepository)
      : super(
          ProfileSettingsGenderState(
            user: _userRepository.lastCurrentUser,
          ),
        ) {
    on<SavePressed>(_onPressedSaveButton);
    on<CancelPressed>(_onPressedCancelButton);
    on<GenderChanged>(_onGenderChanged);
  }
  void _onPressedSaveButton(
    SavePressed event,
    Emitter<ProfileSettingsGenderState> emit,
  ) {
    if (state is _ProfileSettingsGenderState) {
      final profileState = state as _ProfileSettingsGenderState;
      _userRepository.updateUser(profileState.user);
      emitOnce(emit, NavToBack());
    }
  }

  void _onPressedCancelButton(
    CancelPressed event,
    Emitter<ProfileSettingsGenderState> emit,
  ) {
    emitOnce(emit, NavToBack());
  }

  void _onGenderChanged(
    GenderChanged event,
    Emitter<ProfileSettingsGenderState> emit,
  ) {
    if (state is _ProfileSettingsGenderState) {
      final profileState = state as _ProfileSettingsGenderState;
      emit(profileState.copyWith(
        user: profileState.user.copyWith(
          gender: event.gender,
        ),
      ));
    }
  }
}
