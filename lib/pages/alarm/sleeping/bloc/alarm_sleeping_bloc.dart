import 'package:alarm/alarm.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';

part 'alarm_sleeping_event.dart';
part 'alarm_sleeping_state.dart';
part 'alarm_sleeping_command.dart';
part 'alarm_sleeping_bloc.freezed.dart';

@injectable
class AlarmSleepingBloc extends Bloc<AlarmSleepingEvent, AlarmSleepingState>
    with SideEffectBlocMixin<AlarmSleepingState, AlarmSleepingCommand> {
  final AlarmRepository _repository;

  AlarmSleepingBloc(this._repository)
      : super(_Initial(
          currentDate: DateTime.now(),
          alarmTime: _getAlarmTime(_repository),
          currentVolume: 3,
        )) {
    on<_Started>(_onStarted);

    Stream.periodic(const Duration(seconds: 1)).listen(
      (event) {
        emit(
          AlarmSleepingState.initial(
            currentDate: DateTime.now(),
            alarmTime: _getAlarmTime(_repository),
            currentVolume: 3,
          ),
        );
      },
    );
  }

  void _onStarted(
    _Started event,
    Emitter<AlarmSleepingState> emit,
  ) async {
    Future.wait(
      [
        _repository.wakeupTime.forEach((event) {
          if (state is _Initial) {
            final initialState = state as _Initial;
            emit(initialState.copyWith(alarmTime: _getAlarmTime(_repository)));
          }
        }),
        Alarm.ringStream.stream.forEach(
          (_) => produceSideEffect(AlarmSleepingCommand.navToResults()),
        )
      ],
    );
  }

  static String _getAlarmTime(AlarmRepository repo) {
    return repo.alarmEnabled.value
        ? repo.wakeupTime.value.toStringWithColon()
        : "Off";
  }

  void alarmClicked() {
    produceSideEffect(AlarmSleepingCommand.navToAlarm());
  }

  void wakeUpClicked() {
    produceSideEffect(AlarmSleepingCommand.navToResults());
  }
}
