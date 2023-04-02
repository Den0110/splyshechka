import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/domain/entities/alarm/snooze_time.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/model/sleep_time_type.dart';

part 'alarm_settings_event.dart';
part 'alarm_settings_state.dart';
part 'alarm_settings_bloc.freezed.dart';
part 'alarm_settings_command.dart';

@injectable
class AlarmSettingsBloc extends Bloc<AlarmSettingsEvent, AlarmSettingsState>
    with SideEffectBlocMixin<AlarmSettingsState, AlarmSettingsCommand> {
  final AlarmRepository _alarmRepository;
  AlarmSettingsBloc(this._alarmRepository)
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
  }

  void onStarted(
    Started event,
    Emitter<AlarmSettingsState> emit,
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

  SleepTime _calculateGoal(SleepTime bedtime, SleepTime wakeupTime) {
    return wakeupTime - bedtime;
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
    _alarmRepository.setBedtime(state.bedtime);
    await _alarmRepository.setAlarm();
    produceSideEffect(NavBack());
  }

  void cancelClicked() {
    produceSideEffect(NavBack());
  }
}
