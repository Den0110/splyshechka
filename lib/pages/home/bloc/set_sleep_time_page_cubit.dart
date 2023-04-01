import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/model/sleep_time_type.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'set_sleep_time_page_cubit.freezed.dart';

part 'set_sleep_time_page_state.dart';

@injectable
class SetSleepTimePageCubit extends Cubit<SetSleepTimePageState> {
  final AlarmRepository _alarmRepository;

  SetSleepTimePageCubit(this._alarmRepository)
      : super(
          SetSleepTimePageState(
            bedTime: _alarmRepository.bedtime.value,
            wakeUpTime: _alarmRepository.wakeupTime.value,
          ),
        ) {
        }

  void started() async {
    await Future.wait(
      [
        _alarmRepository.bedtime.forEach((value) {
          if (state is _SetSleepTimePageState) {
            final sleepTimeState = state as _SetSleepTimePageState;
            emit(sleepTimeState.copyWith(bedTime: value));
          }
        }),
        _alarmRepository.wakeupTime.forEach((value) {
          if (state is _SetSleepTimePageState) {
            final sleepTimeState = state as _SetSleepTimePageState;
            emit(sleepTimeState.copyWith(wakeUpTime: value));
          }
        }),
      ],
    );
  }

  void timeChanged({
    required SleepTime bedTime,
    required SleepTime wakeUpTime,
  }) {
    _alarmRepository.setBedtime(bedTime);
    _alarmRepository.setWakeupTime(wakeUpTime);
  }

  void editRequested(SleepTimeType initialTab) {
    emitOnce(emit, NavToWentDetails(initialTab: initialTab));
  }

  Future<void> sleepClicked() async {
    emitOnce(emit, NavToSleep());
    await _alarmRepository.setAlarm();
  }

  void cancelClicked() {
    emitOnce(emit, NavToBack());
  }
}
