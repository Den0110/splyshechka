import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_pillow/domain/entities/alarm/sleep_time.dart';

part 'alarm_result_page_bloc.freezed.dart';

part 'alarm_result_page_event.dart';

part 'alarm_result_page_state.dart';

class AlarmResultPageBloc
    extends Bloc<AlarmResultPageEvent, AlarmResultPageState> {
  AlarmResultPageBloc() : super(const AlarmResultPageInitial()) {
    on<LoadStarted>(_loadData);
  }

  void _loadData(LoadStarted event, Emitter<AlarmResultPageState> emit) {
    emit(
      const AlarmResultPageDataLoaded(
        value: 8.40,
        boxes: 1,
        image: "assets/images/pillow.png",
        asleepAfter: SleepTime(h: 0, m: 5),
        wentToBed: SleepTime(h: 23, m: 48),
        wokeUp: SleepTime(h: 9, m: 32),
        inBed: SleepTime(h: 8, m: 12),
        totalSleep: SleepTime(h: 7, m: 52),
        noise: 30,
        quality: 100,
      ),
    );
  }
}
