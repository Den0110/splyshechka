import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/domain/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

part 'profile_settings_avatar_event.dart';
part 'profile_settings_avatar_bloc.freezed.dart';
part 'profile_settings_avatar_state.dart';

@injectable
class ProfileSettingsAvatarBloc
    extends Bloc<ProfileSettingsAvatarEvent, ProfileSettingsAvatarState> {
  final UserRepository _userRepository;
  ProfileSettingsAvatarBloc(this._userRepository)
      : super(
          ProfileSettingsAvatarState(
            user: _userRepository.lastCurrentUser,
          ),
        ) {
    on<ColorChanged>(_onColorChanged);
    on<FaceChanged>(_onFaceChanged);
  }

  @override
  Future<void> close() async {
    final newProfileState = state as _ProfileSettingsAvatarState;
    await _userRepository.updateUser(newProfileState.user);
    await super.close();
  }

  void _onColorChanged(
    ColorChanged event,
    Emitter<ProfileSettingsAvatarState> emit,
  ) {
    if (state is _ProfileSettingsAvatarState) {
      final profileState = state as _ProfileSettingsAvatarState;
      emit(
        profileState.copyWith(
          user: profileState.user.copyWith(
            avatar: profileState.user.avatar.copyWith(
              color: event.color,
            ),
          ),
        ),
      );
    }
  }

  void _onFaceChanged(
    FaceChanged event,
    Emitter<ProfileSettingsAvatarState> emit,
  ) {
    if (state is _ProfileSettingsAvatarState) {
      final profileState = state as _ProfileSettingsAvatarState;
      emit(
        profileState.copyWith(
          user: profileState.user.copyWith(
            avatar: profileState.user.avatar.copyWith(
              emojiUrl: event.face,
            ),
          ),
        ),
      );
    }
  }
}
