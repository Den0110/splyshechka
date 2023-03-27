import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/pages/statistics/all_analysis/widget/model/card_model.dart';

part 'all_analysis_event.dart';
part 'all_analysis_state.dart';
part 'all_analysis_command.dart';
part 'all_analysis_bloc.freezed.dart';

class AllAnalysisBloc extends Bloc<AllAnalysisEvent, AllAnalysisState>
    with SideEffectBlocMixin<AllAnalysisState, AllAnalysisCommand> {
  AllAnalysisBloc()
      : super(const _Initial(
          model: [CardModel(
            sleepQuality: 0,
            awake: '',
            date: '',
            sleepAll: '',
            goBed: '',
          ),]
        )) {
    on<PageOpened>(_onPageOpened);
    on<OnCardClicked>(_onCardClicked);
  }

  void _onPageOpened(event, emit) {
    emit(state.copyWith(
      model: [const CardModel(
        sleepQuality: 100,
        awake: '5:25',
        date: '25 Сентября',
        sleepAll: '5:25',
        goBed: '5:25',
      ),] 
    ));
  }

  void _onCardClicked(event, emit) {
    produceSideEffect(const AllAnalysisCommand.openCard());
  }
}
