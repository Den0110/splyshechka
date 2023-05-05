import 'dart:convert';

import 'package:splyshechka/data/data_source/alarm/local/alarm_props_keys.dart';
import 'package:splyshechka/data/model/alarm/sleep_time_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splyshechka/utils/pref_ext.dart';

@singleton
class AlarmLocalDataSource {
  final SharedPreferences _prefs;

  AlarmLocalDataSource(this._prefs);

  bool get remindToChange => _prefs.getBool(remindToChargeKey) ?? true;
  set remindToChange(bool value) => _prefs.setBool(remindToChargeKey, value);

  SleepTimeDto get bedtime =>
      _prefs.getObject(bedtimeKey, SleepTimeDto.fromJson) ?? const SleepTimeDto(hour: 22, minute: 0);
  set bedtime(SleepTimeDto value) => _prefs.setObject(bedtimeKey, value);

  SleepTimeDto get wakeupTime =>
      _prefs.getObject(wakeupTimeKey, SleepTimeDto.fromJson) ?? const SleepTimeDto(hour: 8, minute: 0);
  set wakeupTime(SleepTimeDto value) => _prefs.setObject(wakeupTimeKey, value);

  bool get remindToSleep => _prefs.getBool(remindToSleepKey) ?? false;
  set remindToSleep(bool value) => _prefs.setBool(remindToSleepKey, value);

  bool get alarmEnabled => _prefs.getBool(alarmEnabledKey) ?? true;
  set alarmEnabled(bool value) => _prefs.setBool(alarmEnabledKey, value);

  bool get vibrationEnabled => _prefs.getBool(vibrationEnabledKey) ?? false;
  set vibrationEnabled(bool value) =>
      _prefs.setBool(vibrationEnabledKey, value);

  double get alarmVolume => _prefs.getDouble(alarmVolumeKey) ?? 70.0;
  set alarmVolume(double value) => _prefs.setDouble(alarmVolumeKey, value);

  int get snoozeTime => _prefs.getInt(snoozeTimeKey) ?? 5;
  set snoozeTime(int value) => _prefs.setInt(snoozeTimeKey, value);
}
