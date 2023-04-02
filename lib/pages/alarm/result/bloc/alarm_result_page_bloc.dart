import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';

part 'alarm_result_page_bloc.freezed.dart';

part 'alarm_result_page_event.dart';

part 'alarm_result_page_state.dart';

@injectable
class AlarmResultPageBloc
    extends Bloc<AlarmResultPageEvent, AlarmResultPageState> {
  final SharedPreferences _prefs;
  AlarmResultPageBloc(
    this._prefs,
  ) : super(const AlarmResultPageState.initial()) {
    on<LoadStarted>(_onStarted);
  }

  Future<void> _onStarted(
    LoadStarted event,
    Emitter<AlarmResultPageState> emit,
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

    _prefs.setInt("lastSleepTime", DateTime.now().millisecondsSinceEpoch);

    emit(AlarmResultPageState.loaded(filePath: files.last));
  }
}
