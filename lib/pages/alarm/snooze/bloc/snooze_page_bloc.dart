import 'package:bloc/bloc.dart';
import 'package:splyshechka/domain/entities/alarm/snooze_time.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'snooze_page_bloc.freezed.dart';

part 'snooze_page_event.dart';

part 'snooze_page_state.dart';

@injectable
class SnoozePageBloc extends Bloc<SnoozePageEvent, SnoozePageState> {
  final AlarmRepository _repository;

  SnoozePageBloc(this._repository)
      : super(
          Initial(selectedIndex: _repository.snoozeTime.value.index),
        ) {
    on<CurrentChanged>((CurrentChanged event, emit) {
      emit(Initial(selectedIndex: event.current));
    });

    on<SaveClicked>((event, emit) {
      if (state is Initial) {
        final initialState = state as Initial;
        _repository.setSnoozeTime(
          SnoozeTime.values[initialState.selectedIndex],
        );
        emitOnce(emit, NavBack());
      }
    });

    on<CancelClicked>((event, emit) {
      emitOnce(emit, NavBack());
    });
  }
}
