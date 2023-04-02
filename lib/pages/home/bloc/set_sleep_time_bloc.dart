import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/model/sleep_time_type.dart';

part 'set_sleep_time_event.dart';
part 'set_sleep_time_state.dart';
part 'set_sleep_time_command.dart';
part 'set_sleep_time_bloc.freezed.dart';

@injectable
class SetSleepTimeBloc extends Bloc<SetSleepTimeEvent, SetSleepTimeState>
    with SideEffectBlocMixin<SetSleepTimeState, SetSleepTimeCommand> {
  final AlarmRepository _alarmRepository;
  SetSleepTimeBloc(this._alarmRepository)
      : super(_Initial(
          bedTime: _alarmRepository.bedtime.value,
          wakeUpTime: _alarmRepository.wakeupTime.value,
        )) {
    on<Started>(_onStarted);
    on<_TimeChanged>(_onTimeChanged);
    on<_CancelClicked>(_onCancelClicked);
    on<_SleepClicked>(_onSleepClicked);
    on<_EditRequested>(_onEditRequested);
  }

  void _onStarted(
    Started event,
    Emitter<SetSleepTimeState> emit,
  ) async {
    await Future.wait(
      [
        emit.forEach(
          _alarmRepository.bedtime,
          onData: (SleepTime value) => state.copyWith(bedTime: value),
        ),
         emit.forEach(
          _alarmRepository.wakeupTime,
          onData: (SleepTime value) => state.copyWith(wakeUpTime: value),
        ),
      ],
    );
  }

  void _onTimeChanged(
    _TimeChanged event,
    Emitter<SetSleepTimeState> emit,
  ) {
    _alarmRepository.setBedtime(event.bedTime);
    _alarmRepository.setWakeupTime(event.wakeUpTime);
  }

  void _onEditRequested(
    _EditRequested event,
    Emitter<SetSleepTimeState> emit,
  ) {
    produceSideEffect(NavToWentDetails(initialTab: event.initialTab));
  }

  Future<void> _onSleepClicked(
    _SleepClicked event,
    Emitter<SetSleepTimeState> emit,
  ) async {
    produceSideEffect(NavToSleep());
    await _alarmRepository.setAlarm();
  }

  void _onCancelClicked(
    _CancelClicked event,
    Emitter<SetSleepTimeState> emit,
  ) {
    produceSideEffect(NavToBack());
  }
}
