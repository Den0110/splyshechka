import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/domain/entities/alarm/snooze_time.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/model/sleep_time_type.dart';

part 'set_sleep_time_details_event.dart';
part 'set_sleep_time_details_state.dart';
part 'set_sleep_time_details_command.dart';
part 'set_sleep_time_details_bloc.freezed.dart';

@injectable
class SetSleepTimeDetailsBloc
    extends Bloc<SetSleepTimeDetailsEvent, SetSleepTimeDetailsState>
    with
        SideEffectBlocMixin<SetSleepTimeDetailsState,
            SetSleepTimeDetailsCommand> {
  final AlarmRepository _alarmRepository;

  SetSleepTimeDetailsBloc(this._alarmRepository)
      : super(Initial(
          bedtime: _alarmRepository.bedtime.value,
          wakeupTime: _alarmRepository.wakeupTime.value,
          remindToSleep: _alarmRepository.remindToSleep.value,
          alarmEnabled: _alarmRepository.alarmEnabled.value,
          vibrationEnabled: _alarmRepository.vibrationEnabled.value,
          alarmVolume: _alarmRepository.alarmVolume.value,
          snoozeTime: _alarmRepository.snoozeTime.value,
          sleepGoal: _alarmRepository.wakeupTime.value -
              _alarmRepository.bedtime.value,
          selectedTab: SleepTimeType.bedtime,
        )) {
    on<Started>(onStarted);
    on<PageOpened>(_onPageOpened);
  }

  void onStarted(
    Started event,
    Emitter<SetSleepTimeDetailsState> emit,
  ) async {
    await Future.wait(
      [
        emit.forEach(
          _alarmRepository.bedtime,
          onData: (SleepTime value) {
            return state.copyWith(
              bedtime: value,
              sleepGoal: _calculateGoal(value, state.wakeupTime),
            );
          },
        ),
        emit.forEach(
          _alarmRepository.wakeupTime,
          onData: (SleepTime value) {
            return state.copyWith(
              wakeupTime: value,
              sleepGoal: _calculateGoal(state.bedtime, value),
            );
          },
        ),
        emit.forEach(
          _alarmRepository.remindToSleep,
          onData: (bool value) {
            return state.copyWith(
              remindToSleep: value,
            );
          },
        ),
        emit.forEach(
          _alarmRepository.alarmEnabled,
          onData: (bool value) {
            return state.copyWith(
              alarmEnabled: value,
            );
          },
        ),
        emit.forEach(
          _alarmRepository.vibrationEnabled,
          onData: (bool value) {
            return state.copyWith(
              vibrationEnabled: value,
            );
          },
        ),
        emit.forEach(
          _alarmRepository.alarmVolume,
          onData: (double value) {
            return state.copyWith(
              alarmVolume: value,
            );
          },
        ),
        emit.forEach(
          _alarmRepository.snoozeTime,
          onData: (SnoozeTime value) {
            return state.copyWith(
              snoozeTime: value,
            );
          },
        ),
      ],
    );
  }

  void _onPageOpened(
    PageOpened event,
    Emitter<SetSleepTimeDetailsState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.sleepTimeType));
  }

  void _withInitialState(Function(Initial state) f) {
    if (state is Initial) {
      f(state as Initial);
    }
  }

  SleepTime _calculateGoal(
    SleepTime bedtime,
    SleepTime wakeupTime,
  ) {
    return wakeupTime - bedtime;
  }

  void selectTab(SleepTimeType type) {
    _withInitialState((state) {
      emit(state.copyWith(selectedTab: type));
    });
  }

  void bedTimeChanged(SleepTime bedtime) {
    _alarmRepository.setBedtime(bedtime);
  }

  void remindToSleepSwitched(bool remindToSleepEnabled) {
    _alarmRepository.setRemindToSleep(remindToSleepEnabled);
  }

  void alarmTimeChanged(SleepTime alarmTime) {
    _alarmRepository.setWakeupTime(alarmTime);
  }

  void alarmSwitched(bool enabled) {
    _alarmRepository.setAlarmEnabled(enabled);
  }

  void vibrationSwitched(bool enabled) {
    _alarmRepository.setVibrationEnabled(enabled);
  }

  void volumeChanged(double volume) {
    _alarmRepository.setAlarmVolume(volume);
  }

  void snoozeChanged() {
    produceSideEffect(NavToSnooze());
  }

  void delayClicked() {
    produceSideEffect(NavToDelay());
  }

  void okayClicked() async {
    await _alarmRepository.setAlarm();
    produceSideEffect(NavBack());
  }

  void cancelClicked() {
    produceSideEffect(NavBack());
  }
}
