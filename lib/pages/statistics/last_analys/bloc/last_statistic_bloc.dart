import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
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
    Directory dir = await getApplicationDocumentsDirectory();
    final pathSegs = dir.uri.pathSegments.where((e) => e.isNotEmpty).toList();
    pathSegs.removeLast();
    pathSegs.add('files');
    dir = Directory(pathSegs.join('/'));
    final files = await dir
        .list()
        .map((e) => e.path)
        .where((e) => e.contains('recording') && e.endsWith('txt'))
        .toList();
    files.sort();
    emit(LastStatisticState.initial(loading: false, sleepFilePath: files.last));
  }
}
