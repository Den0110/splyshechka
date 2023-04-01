import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
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
  ) : super(AlarmSleepingState(
          currentDate: DateTime.now(),
          alarmTime: _getAlarmTime(_repository),
          volume: 0,
          visualVolume: 0,
        )) {
    on<Started>(_onStarted);
  }

  Future<void> _onStarted(
    Started event,
    Emitter<AlarmSleepingState> emit,
  ) async {
    if ((await Permission.microphone.request()).isGranted) {
      _backgroundService.startService();
    }
    await Future.wait([
      emit.forEach(_repository.wakeupTime.stream, onData: (data) {
        return state.copyWith(alarmTime: _getAlarmTime(_repository));
      }),
      emit.forEach<Map<String, dynamic>?>(
          _backgroundService.on('decibelUpdate'), onData: (data) {
        debugPrint(data.toString());
        final decibel = double.tryParse(data!["decibel"].toString()) ?? .0;
        final visualVolume = decibel / 100.0 * 6.0;
        return state.copyWith(
          visualVolume: visualVolume,
          volume: decibel.toInt(),
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
