import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/entities/profile/sleep_user.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/pages/main/bloc/main_ui_model.dart';

part 'main_bloc.freezed.dart';

part 'main_event.dart';
part 'main_command.dart';
part 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState>
    with SideEffectBlocMixin<MainState, MainCommand> {
  final UserRepository _userRepository;
  MainBloc(this._userRepository)
      : super(
          MainState.pageOpen(user: _userRepository.lastCurrentUser),
        ) {
    on<AvatarClicked>(_onAvatarClicked);
    on<PageOpened>(_onPageOpened);
  }

  void _onAvatarClicked(event, emit) {
    produceSideEffect(MainCommand.navToProfile());
  }

  void _onPageOpened(
    PageOpened event,
    Emitter<MainState> emit,
  ) async {
    await for (final user in _userRepository.currentUser.stream) {
      if (state is PageOpen) {
        final userState = state as PageOpen;
        emit(userState.copyWith(user: user));
      }
      emit(MainState.pageOpen(
        user: _userRepository.lastCurrentUser,
      ));
    }
  }
}
