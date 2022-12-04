import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

part 'good_morning_bloc.freezed.dart';

part 'good_morning_event.dart';

part 'good_morning_state.dart';

@injectable
class GoodMorningBloc extends Bloc<GoodMorningEvent, GoodMorningState> {
  GoodMorningBloc() : super(Initial(dateTime: DateTime.now())) {
    on<WokeUp>(
      (event, emit) {
        emitOnce(
          emit,
          WakeUp(),
        );
      },
    );

    on<Delayed>(
      (event, emit) {
        emitOnce(
          emit,
          Delay(),
        );
      },
    );
  }
}
