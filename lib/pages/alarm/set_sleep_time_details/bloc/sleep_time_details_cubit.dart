import 'package:bloc/bloc.dart';
import 'package:my_pillow/domain/entities/alarm/sleep_time.dart';
import 'package:my_pillow/domain/entities/alarm/snooze_time.dart';
import 'package:my_pillow/domain/repository/alarm_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_pillow/pages/alarm/set_sleep_time_details/model/sleep_time_type.dart';
import 'package:my_pillow/utils/one_shot_bloc.dart';

part 'sleep_time_details_cubit.freezed.dart';

part 'sleep_time_details_state.dart';

@injectable
class SleepTimeDetailsCubit extends Cubit<SleepTimeDetailsState> {
  final AlarmRepository _alarmRepository;

  SleepTimeDetailsCubit(this._alarmRepository)
      : super(
          Initial(
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
          ),
        ) {
    _alarmRepository.bedtime.listen((value) {
      _withInitialState((state) {
        emit(state.copyWith(
          bedtime: value,
          sleepGoal: _calculateGoal(value, state.wakeupTime),
        ));
      });
    });
    _alarmRepository.wakeupTime.listen((value) {
      _withInitialState((state) {
        emit(state.copyWith(
          wakeupTime: value,
          sleepGoal: _calculateGoal(state.bedtime, value),
        ));
      });
    });
    _alarmRepository.remindToSleep.listen((value) {
      _withInitialState((state) {
        emit(state.copyWith(
          remindToSleep: value,
        ));
      });
    });
    _alarmRepository.alarmEnabled.listen((value) {
      _withInitialState((state) {
        emit(state.copyWith(
          alarmEnabled: value,
        ));
      });
    });
    _alarmRepository.vibrationEnabled.listen((value) {
      _withInitialState((state) {
        emit(state.copyWith(
          vibrationEnabled: value,
        ));
      });
    });
    _alarmRepository.alarmVolume.listen((value) {
      _withInitialState((state) {
        emit(state.copyWith(
          alarmVolume: value,
        ));
      });
    });
    _alarmRepository.snoozeTime.listen((value) {
      _withInitialState((state) {
        emit(state.copyWith(
          snoozeTime: value,
        ));
      });
    });
  }

  void _withInitialState(Function(Initial state) f) {
    if (state is Initial) {
      f(state as Initial);
    }
  }

  SleepTime _calculateGoal(SleepTime bedtime, SleepTime wakeupTime) {
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

  void snoozeClicked() {
    emitOnce(emit, NavToSnooze());
  }

  void okayClicked() {
    emitOnce(emit, NavBack());
  }
}
