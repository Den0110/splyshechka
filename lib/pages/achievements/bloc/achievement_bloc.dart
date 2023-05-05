import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/models/achievements/achievement.dart';

part 'achievement_event.dart';
part 'achievement_state.dart';
part 'achievement_command.dart';
part 'achievement_bloc.freezed.dart';

@injectable
class AchievementBloc extends Bloc<AchievementEvent, AchievementState>
    with SideEffectBlocMixin<AchievementState, AchievementCommand> {
  AchievementBloc()
      : super(
          const _Initial(
            selectedPage: 0,
            listReady: [],
            listUnready: [],
            loading: true,
          ),
        ) {
    on<PageChanged>(_onPageChanged);
  }

   void _onPageChanged(
    PageChanged event,
    Emitter<AchievementState> emit,
  )  {
    emit(state.copyWith(selectedPage: event.index));
  }

}
