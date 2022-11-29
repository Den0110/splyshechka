import 'package:flutter_bloc/flutter_bloc.dart';

abstract class OneShotState {}

extension SleepBloc<Event, State> on Bloc<Event, State> {
  void emitOnce(Emitter emit, State newState) {
    final prevState = state;
    emit(newState);
    if (state is OneShotState) emit(prevState);
  }
}

extension SleepCubit<State> on Cubit<State> {
  void emitOnce(Function(State) emit, State newState) {
    final prevState = state;
    emit(newState);
    if (state is OneShotState) emit(prevState);
  }
}

class OneShotBlocConsumer<B extends StateStreamable<S>, S>
    extends BlocConsumer<B, S> {
  OneShotBlocConsumer({
    super.key,
    required super.builder,
    required super.listener,
    super.bloc,
    super.listenWhen,
  }) : super(
    buildWhen: (previous, current) => current is OneShotState == false,
  );
}
