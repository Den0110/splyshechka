import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/achievement/achievement_dto.dart';
import 'package:splyshechka/domain/models/achievements/achievement_list.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

part 'achievement_event.dart';
part 'achievement_state.dart';
part 'achievement_command.dart';
part 'achievement_bloc.freezed.dart';

@injectable
class AchievementBloc extends Bloc<AchievementEvent, AchievementState>
    with SideEffectBlocMixin<AchievementState, AchievementCommand> {
  final NewUserRemoteDataSource _dataSource;
  final UserRepository _userRepository;
  AchievementBloc(
    this._dataSource,
    this._userRepository,
  ) : super(
          const _Initial(
            wasOpened: false,
            selectedPage: 0,
            listReady: [],
            listUnready: [],
            loading: true,
          ),
        ) {
    on<PageOpened>(_onPageOpened);
  }

  Future<void> _onPageOpened(
    PageOpened event,
    Emitter<AchievementState> emit,
  ) async {
    if (!state.wasOpened) {
      try {
        bool isGotten = true;
        // bool isGotten = await _dataSource.updateAchievement(
        //   _userRepository.currentUser.valueOrNull!.token,
        //   1,
        // );
        if (isGotten) {
          produceSideEffect(const OpenDialog());
        }
      } catch (e) {}
      emit(state.copyWith(wasOpened: true));
    }

    try {
      List<AchievementDto> achievements = await _dataSource.getAllAchievements(
        _userRepository.currentUser.valueOrNull!.token,
      );
      final acquiredAchivements =
          achievements.where((element) => element.isAchieved).toList();
      final notAcquiredAchivements =
          achievements.where((element) => !element.isAchieved).toList();

      emit(state.copyWith(
        listReady: acquiredAchivements,
        listUnready: notAcquiredAchivements,
      ));
    } catch (e) {}
    emit(state.copyWith(loading: false));
  }
}
