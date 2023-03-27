import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

part 'all_analysis_event.dart';
part 'all_analysis_state.dart';
part 'all_analysis_command.dart';
part 'all_analysis_bloc.freezed.dart';

@injectable
class AllAnalysisBloc extends Bloc<AllAnalysisEvent, AllAnalysisState>
    with SideEffectBlocMixin<AllAnalysisState, AllAnalysisCommand> {
  final NewUserRemoteDataSource _dataSource;
  final UserRepository _userRepository;
  AllAnalysisBloc(this._dataSource, this._userRepository)
      : super(const _Initial(
          listSleep: [],
          loading: true,
        )) {
    on<PageOpened>(_onPageOpened);
    on<OnCardClicked>(_onCardClicked);
  }

  void _onPageOpened(
    PageOpened event,
    Emitter<AllAnalysisState> emit,
  ) async {
    try {
      final List<SleepDto> sleep = await _dataSource.getAllSleep(
        _userRepository.currentUser.valueOrNull!.token,
      );
      emit(state.copyWith(listSleep: sleep));
    } catch (e) {}
    emit(state.copyWith(loading: false));
  }

  void _onCardClicked(
    OnCardClicked event,
    Emitter<AllAnalysisState> emit,
  ) {
    produceSideEffect(AllAnalysisCommand.openCard(
      sleep: event.sleep,
    ));
  }
}
