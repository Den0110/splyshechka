import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';

part 'last_statistic_event.dart';
part 'last_statistic_state.dart';
part 'last_statistic_command.dart';
part 'last_statistic_bloc.freezed.dart';

@injectable
class LastStatisticBloc extends Bloc<LastStatisticEvent, LastStatisticState>
    with SideEffectBlocMixin<LastStatisticState, LastStatisticCommand> {
  final NewUserRemoteDataSource _dataSource;
  final UserRepository _userRepository;
  LastStatisticBloc(
    this._dataSource,
    this._userRepository,
  ) : super(
          const _Initial(
            loading: true,
          ),
        ) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<LastStatisticState> emit,
  ) async {
    try {
      final SleepDto sleep = await _dataSource.getLastSleep(
        _userRepository.currentUser.valueOrNull!.token,
      );
      emit(state.copyWith(sleep: sleep));
    } catch (e) {}
     emit(state.copyWith(loading: false));
  }
}
