import 'package:alarm/alarm.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'good_morning_bloc.freezed.dart';

part 'good_morning_event.dart';

part 'good_morning_state.dart';

@injectable
class GoodMorningBloc extends Bloc<GoodMorningEvent, GoodMorningState> {
  final AlarmRepository _alarmRepository;
  GoodMorningBloc(
    this._alarmRepository,
  ) : super(
          Initial(dateTime: DateTime.now()),
        ) {
    on<WokeUp>(onWokeUp);
    on<Delayed>(onDelayed);
  }

  onWokeUp<WokeUp>(WokeUp event, emit) async {
    await Alarm.stop(42);
    emitOnce(emit, WakeUp());
  }

  onDelayed<Delayed>(Delayed event, emit) async {
    await _alarmRepository.snoozeAlarm();
    emitOnce(emit, Delay());
  }
}
