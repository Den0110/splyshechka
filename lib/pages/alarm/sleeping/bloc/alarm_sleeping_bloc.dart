import 'package:alarm/alarm.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';

part 'alarm_sleeping_bloc.freezed.dart';

part 'alarm_sleeping_command.dart';

part 'alarm_sleeping_event.dart';

part 'alarm_sleeping_state.dart';

@injectable
class AlarmSleepingBloc extends Bloc<AlarmSleepingEvent, AlarmSleepingState>
    with SideEffectBlocMixin<AlarmSleepingState, AlarmSleepingCommand> {
  final AlarmRepository _repository;
  final FlutterBackgroundService _backgroundService;

  AlarmSleepingBloc(
    this._repository,
    this._backgroundService,
  ) : super(_Initial(
          currentDate: DateTime.now(),
          alarmTime: _getAlarmTime(_repository),
          currentVolume: 3,
        )) {
    on<Started>(_onStarted);
  }

  Future<void> _onStarted(
    Started event,
    Emitter<AlarmSleepingState> emit,
  ) async {
    await Future.wait(
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
    if ((await Permission.microphone.request()).isGranted) {
      _backgroundService.startService();
    }
    await Future.wait([
      emit.forEach(_repository.wakeupTime.stream, onData: (data) {
        if (state is _Initial) {
          final initialState = state as _Initial;
          return initialState.copyWith(alarmTime: _getAlarmTime(_repository));
        }
        return state;
      }),
      emit.forEach<bool>(
          Stream.periodic(const Duration(seconds: 1))
              .asyncMap((event) async => await _backgroundService.isRunning()),
          onData: (data) {
        return AlarmSleepingState.initial(
          currentDate: DateTime.now(),
          alarmTime: _getAlarmTime(_repository),
          currentVolume: data ? 3 : 0,
        );
      }),
    ]);
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
    _backgroundService.invoke('stopService');
    produceSideEffect(AlarmSleepingCommand.navToResults());
  }
}
