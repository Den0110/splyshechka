import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/achievement/index_dto.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/domain/repository/user_repository.dart';
import 'package:splyshechka/utils/date_formatter.dart';

part 'sleep_analysis_bloc.freezed.dart';
part 'sleep_analysis_event.dart';
part 'sleep_analysis_command.dart';
part 'sleep_analysis_state.dart';

@injectable
class SleepAnalysisBloc extends Bloc<SleepAnalysisEvent, SleepAnalysisState>
 with SideEffectBlocMixin<SleepAnalysisState, SleepAnalysisCommand>  {
  final SharedPreferences _prefs;
  final NewUserRemoteDataSource _dataSource;
  final UserRepository _userRepository;

  SleepAnalysisBloc(
    this._prefs,
    this._dataSource,
    this._userRepository,
  ) : super(SleepAnalysisState.loading()) {
    on<Pushed>(_onPushed);
    on<Started>(_onStarted);
    // on<Started>((event, emit) async {
    //   try {
    //     final lastRecord = File(event.filePath);
    //     final contents = await lastRecord.readAsString();
    //     emit(await _parseSleepData(contents));
    //   } catch (e) {
    //     debugPrint(e.toString());
    //   }
    // });
  }

  Future<void> _onStarted(
    Started event,
    Emitter<SleepAnalysisState> emit,
  ) async {
    try {
      final lastRecord = File(event.filePath);
      final contents = await lastRecord.readAsString();
      emit(await _parseSleepData(contents));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _onPushed(
    Pushed event,
    Emitter<SleepAnalysisState> emit,
  ) async {}

  Future<SleepAnalysisState> _parseSleepData(String content) async {
    final parts = content.split(";").toList();
    parts.removeWhere((e) => e.isEmpty);

    // final p = parts.sublist(1);
    // parts.addAll(List.generate(2000, (index) => p).expand((i) => i).toList());

    String start = parts[0];

    final wentSleepAt =
        DateTime.fromMillisecondsSinceEpoch((int.tryParse(start) ?? 0) * 1000);

    final lightStageEntries = parts
        .skip(1)
        .map((e) => BarEntry(int.tryParse(e.split(' ')[0]) ?? 0, 0));

    final sleepStageEntries = <BarEntry>[];

    final xVals = <String>[];

    final p1 = parts.skip(2).toList();
    final format = DateFormat("HH:mm");
    for (int i = 0; i < p1.length; i++) {
      DateTime df = wentSleepAt.add(Duration(milliseconds: i * 500));
      xVals.add(format.format(df));
      sleepStageEntries.add(BarEntry(int.tryParse(p1[i].split(' ')[3]) ?? 0, 0));
    }

    int j = 0;

    int movements = 0;

    // 30 minute intervals
    final intervalsCount = (parts.length / 30.0).ceil();
    final intervals = List.generate(intervalsCount, (index) => 0);
    final lightIntervals = List.generate(intervalsCount, (index) => 0);

    int sleepEvents = 0;
    int movementEvents = 0;
    int snoreEvents = 0;

    int awake = 0;
    int sleep = 0;

    int nightLight = 0;
    int dawnLight = 0;
    int dayLight = 0;

    Duration? asleepAfter;
    int asleepCounter = 0;

    final lightsIntensities = [];

    int decibelSum = 0;
    int decibelCount = 0;

    for (int i = 2; i < parts.length; i++) {
      final values = parts[i].split(" ");
      j++;
      asleepCounter++;
      if (values[1] == "0") {
        sleepEvents++;
      }
      if (values[1] == "1") {
        snoreEvents++;
        asleepCounter = 0;
      }
      if (values[1] == "2") {
        movementEvents++;
        movements++;
        asleepCounter = 0;
      }
      //after 5 min
      if (asleepAfter == null && asleepCounter > 60 * .5 / 5) {
        asleepAfter = Duration(seconds: (0.5 * i).toInt());
      }
      int lightIntensity = int.tryParse(values[0]) ?? 0;
      if (lightIntensity <= 20) {
        nightLight++;
      } else if (lightIntensity <= 100) {
        dawnLight++;
      } else {
        dayLight++;
      }

      lightsIntensities.add(lightIntensity);

      if (int.tryParse(values[3]) != null) {
        decibelSum += int.tryParse(values[3]) ?? 0;
        decibelCount++;
      }

      if (i % 300 == 0) {
        // Add the movement interval
        if (movements > 1) {
          intervals[i ~/ 300.0] = movements;
          awake++;
        } else {
          sleep++;
        }
        movements = 0;

        // Add the light interval
        int lightSum = 0;
        for (int intensity in lightsIntensities) {
          lightSum += intensity;
        }
        lightIntervals[i ~/ 300] = lightSum ~/ lightsIntensities.length;
        lightsIntensities.clear();
      }
    }

    int phases = 0;
    bool isSleeping = false;

    for (int i = 0; i < intervals.length; i++) {
      // Set x value
      int dv = ((int.tryParse(start) ?? 0) + 5 * (i * 3)) * 1000;
      DateTime df = DateTime.fromMillisecondsSinceEpoch(dv);
      // xVals.add(DateFormat("HH:mm").format(df));

      int movementAmount = 0;
      if (intervals[i] > 0) {
        movementAmount = intervals[i];
      }

      // sleepStageEntries.add(BarEntry(movementAmount, i));
      if (movementAmount > 0) {
        if (isSleeping) {
          phases++;
          isSleeping = false;
        }
      } else {
        if (!isSleeping) {
          isSleeping = true;
        }
      }

      // lightStageEntries.add(Entry(lightIntervals[i], i));
    }

    double qualityLight = 1;
    // If one hour of the sleep was during daylight consider the light quality bad
    if (dayLight >= 36000) {
      qualityLight = 0;
    } else if (dawnLight + dayLight >= 54000) {
      // If one hour of the sleep was during dawn, consider the light quality medium
      qualityLight = 0.5;
    }

    double qualityPhases = 1;
    // Too much phases are no good sign
    if (phases > 10) {
      final delta = (phases - 10).toDouble();
      qualityPhases = qualityPhases - translate(delta, 0, max(10, delta), 0, 1);
    } else if (phases < 4) {
      final delta = (4 - phases).toDouble();
      qualityPhases = qualityPhases - translate(delta, 0, 4, 0, 1);
    }

    final sleepUnix =
        _prefs.getInt('lastSleepTime') ?? DateTime.now().millisecondsSinceEpoch;
    final awakeDateTime = DateTime.fromMillisecondsSinceEpoch(sleepUnix);
    final sleepTime = awakeDateTime.difference(wentSleepAt);
    final hours = sleepTime.inMinutes / 60;
    double qualitySleep = translate(hours, 0, max(hours, 7), 0, 1);

    int averageQuality =
        ((qualityPhases + qualitySleep + qualityLight) / 3.0 * 100.0).toInt();
    debugPrint("qualityPhases = $qualityPhases");
    debugPrint("qualitySleep = $qualitySleep");
    debugPrint("qualityLight = $qualityLight");
    debugPrint("averageQuality = $averageQuality");
    debugPrint("lightStageEntries");
    for (var e in lightStageEntries) {
      debugPrint(e.toString());
    }
    debugPrint("sleepStageEntries");
    for (var e in sleepStageEntries) {
      debugPrint(e.toString());
    }
    debugPrint("xVals");
    for (var e in xVals) {
      debugPrint(e.toString());
    }

    debugPrint("sleep=$sleep,awake=$awake");
    debugPrint(
        "sleepEvents=$sleepEvents,movementEvents=$sleepEvents,snoreEvents=$sleepEvents");
    debugPrint(
        "nightLight=$nightLight, dawnLight=$dawnLight, dayLight$dawnLight");

    final asleepAfterTime = SleepTime(
      h: asleepAfter?.inHours ?? 0,
      m: (asleepAfter?.inMinutes ?? 0) % 60,
    );

    final totalSleepTime =
        SleepTime(h: hours.toInt(), m: ((hours - hours.toInt()) * 60).toInt());

    final averageNoise = decibelSum / decibelCount;

    SleepDto sleepDto = SleepDto(
      noise: averageNoise.toInt(),
      quality: averageQuality,
      went_sleep: wentSleepAt,
      waked_up_at: awakeDateTime,
      slept_during: toBack(totalSleepTime),
      fell_asleep_during: asleepAfterTime.h * 60 + asleepAfterTime.m,
      time_spent_in_bed: toBack(totalSleepTime - asleepAfterTime),
    );

    if (_userRepository.sleepDtoStream.value) {
      await _dataSource.addSleep(
        _userRepository.currentUser.value.token,
        sleepDto,
      );
    }

    if (totalSleepTime.h >= 11) {
      try {
        bool isGotten = await _dataSource.updateAchievement(
          _userRepository.currentUser.valueOrNull!.token,
          const IndexDto(index: 2),
        );
        if (isGotten) {
          produceSideEffect(SleepAnalysisCommand.openDialog(index: 2));
        }
      } catch (e) {}
    } else if (totalSleepTime.h == 8 ||
        (totalSleepTime.h == 9 && totalSleepTime.m == 0)) {
       try {
        bool isGotten = await _dataSource.updateAchievement(
          _userRepository.currentUser.valueOrNull!.token,
          const IndexDto(index: 3),
        );
        if (isGotten) {
          produceSideEffect(SleepAnalysisCommand.openDialog(index: 3));
        }
      } catch (e) {}
       try {
        bool isGotten = await _dataSource.updateAchievement(
          _userRepository.currentUser.valueOrNull!.token,
          const IndexDto(index: 4),
        );
        if (isGotten) {
          produceSideEffect(SleepAnalysisCommand.openDialog(index: 4));
        }
      } catch (e) {}
       try {
        bool isGotten = await _dataSource.updateAchievement(
          _userRepository.currentUser.valueOrNull!.token,
          const IndexDto(index: 5),
        );
        if (isGotten) {
          produceSideEffect(SleepAnalysisCommand.openDialog(index: 5));
        }
      } catch (e) {}
       try {
        bool isGotten = await _dataSource.updateAchievement(
          _userRepository.currentUser.valueOrNull!.token,
          const IndexDto(index: 6),
        );
        if (isGotten) {
          produceSideEffect(SleepAnalysisCommand.openDialog(index: 6));
        }
      } catch (e) {}
    } else if (totalSleepTime.h == 4 ||
        totalSleepTime.h == 5 ||
        (totalSleepTime.h == 6 && totalSleepTime.m == 0)) {
      try {
        bool isGotten = await _dataSource.updateAchievement(
          _userRepository.currentUser.valueOrNull!.token,
          const IndexDto(index: 7),
        );
        if (isGotten) {
          produceSideEffect(SleepAnalysisCommand.openDialog(index: 7));
        }
      } catch (e) {}
    }

    return SleepAnalysisState.loaded(
      wentToBed: SleepTime(h: wentSleepAt.hour, m: wentSleepAt.minute),
      asleepAfter: asleepAfterTime,
      totalSleep: totalSleepTime,
      inBed: totalSleepTime - asleepAfterTime,
      wokeUp: SleepTime(h: awakeDateTime.hour, m: awakeDateTime.minute),
      noise: averageNoise.toInt(),
      quality: averageQuality,
      chartSleepData: sleepStageEntries.map((e) => e.first).toList(),
      chartLightData: lightStageEntries.map((e) => e.first).toList(),
      chartLabels: xVals,
    );
  }

  double translate(double value, double leftMin, double leftMax,
      double rightMin, double rightMax) {
    double leftSpan = leftMax - leftMin;
    double rightSpan = rightMax - rightMin;
    double valueScaled = (value - leftMin) / leftSpan;
    return rightMin + (valueScaled * rightSpan);
  }
}

class BarEntry {
  final int first;
  final int second;

  BarEntry(this.first, this.second);

  @override
  String toString() {
    return 'BarEntry{first: $first, second: $second}';
  }
}

class Entry {
  final int first;
  final int second;

  Entry(this.first, this.second);

  @override
  String toString() {
    return 'Entry{first: $first, second: $second}';
  }
}
