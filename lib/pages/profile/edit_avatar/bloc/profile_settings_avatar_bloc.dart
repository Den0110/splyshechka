import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/field_avatar_dto.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/models/pickers/face_picker_items.dart';
import 'package:splyshechka/models/pickers/sleep_color_picker_items.dart';

part 'profile_settings_avatar_event.dart';
part 'profile_settings_avatar_bloc.freezed.dart';
part 'profile_settings_avatar_state.dart';

@injectable
class ProfileSettingsAvatarBloc
    extends Bloc<ProfileSettingsAvatarEvent, ProfileSettingsAvatarState> {
  final UserRepository _userRepository;
  final NewUserRemoteDataSource _dataSource;
  ProfileSettingsAvatarBloc(this._userRepository, this._dataSource)
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

    await _dataSource.updateColorUser(
      newProfileState.user.token,
      FieldAvatarDto(
        field: sleepColorPickerItems.indexWhere(
          (element) => element == newProfileState.user.avatar.color,
        ),
      ),
    );
    await _dataSource.updateImageUser(
      newProfileState.user.token,
      FieldAvatarDto(
        field: facePickerItems.indexWhere(
          (element) => element == newProfileState.user.avatar.emojiUrl,
        ),
      ),
    );
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
