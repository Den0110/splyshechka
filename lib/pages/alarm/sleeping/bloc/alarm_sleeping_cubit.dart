import 'package:bloc/bloc.dart';
import 'package:my_pillow/domain/repository/alarm_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_pillow/utils/one_shot_bloc.dart';

part 'alarm_sleeping_cubit.freezed.dart';

part 'alarm_sleeping_state.dart';

@injectable
class AlarmSleepingCubit extends Cubit<AlarmSleepingState> {
  final AlarmRepository _repository;

  AlarmSleepingCubit(this._repository)
      : super(
          AlarmSleepingState.initial(
            currentDate: DateTime.now(),
            alarmTime: _getAlarmTime(_repository),
            currentVolume: 3,
          ),
        ) {
    Stream.periodic(const Duration(seconds: 1)).listen((event) {
      emit(
        AlarmSleepingState.initial(
          currentDate: DateTime.now(),
          alarmTime: _getAlarmTime(_repository),
          currentVolume: 3,
        ),
      );
    });

    _repository.wakeupTime.stream.listen((event) {
      if (state is Initial) {
        final initialState = state as Initial;
        emit(initialState.copyWith(alarmTime: _getAlarmTime(_repository)));
      }
    });
  }

  static String _getAlarmTime(AlarmRepository repo) {
    return repo.alarmEnabled.value
        ? repo.wakeupTime.value.toStringWithColon()
        : "Off";
  }

  void alarmClicked() {
    emitOnce(emit, NavToAlarm());
  }

  void wakeUpClicked() {
    emitOnce(emit, NavToResults());
  }
}
