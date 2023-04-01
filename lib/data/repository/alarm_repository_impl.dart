import 'package:alarm/alarm.dart';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/data/data_source/alarm/local/alarm_local_data_source.dart';
import 'package:splyshechka/data/model/alarm/sleep_time_dto.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/domain/entities/alarm/snooze_time.dart';
import 'package:splyshechka/domain/repository/alarm_repository.dart';

@Singleton(as: AlarmRepository)
class AlarmRepositoryImpl extends AlarmRepository {
  final AlarmLocalDataSource _dataSource;

  AlarmRepositoryImpl(this._dataSource) {
    _fetchProps();
  }

  void _fetchProps() {
    remindToChange.add(_dataSource.remindToChange);
    bedtime.add(_dataSource.bedtime.toModel());
    wakeupTime.add(_dataSource.wakeupTime.toModel());
    remindToSleep.add(_dataSource.remindToSleep);
    alarmEnabled.add(_dataSource.alarmEnabled);
    vibrationEnabled.add(_dataSource.vibrationEnabled);
    alarmVolume.add(_dataSource.alarmVolume);
    snoozeTime.add(SnoozeTime.fromValue(_dataSource.snoozeTime));
  }

  @override
  void setRemindToChange(bool value) {
    remindToChange.add(value);
    _dataSource.remindToChange = value;
  }

  @override
  void setBedtime(SleepTime value) {
    bedtime.add(value);
    _dataSource.bedtime = SleepTimeMapper.fromModel(value);
  }

  @override
  void setWakeupTime(SleepTime value) {
    wakeupTime.add(value);
    _dataSource.wakeupTime = SleepTimeMapper.fromModel(value);
  }

  @override
  void setRemindToSleep(bool value) {
    remindToSleep.add(value);
    _dataSource.remindToSleep = value;
  }

  @override
  void setAlarmEnabled(bool value) {
    alarmEnabled.add(value);
    _dataSource.alarmEnabled = value;
  }

  @override
  void setAlarmVolume(double value) {
    alarmVolume.add(value);
    _dataSource.alarmVolume = value;
  }

  @override
  void setVibrationEnabled(bool value) {
    vibrationEnabled.add(value);
    _dataSource.vibrationEnabled = value;
  }

  @override
  void setSnoozeTime(SnoozeTime value) {
    snoozeTime.add(value);
    _dataSource.snoozeTime = value.value;
  }

  @override
  Future<void> setAlarm() async {
    final alarmSettings = AlarmSettings(
      id: 42,
      dateTime: setTime(),
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: vibrationEnabled.value,
      fadeDuration: 3.0,
      notificationTitle: 'This is the title',
      notificationBody: 'This is the body',
      enableNotificationOnKill: true,
    );
    await Alarm.set(alarmSettings: alarmSettings);
  }

  DateTime setTime() {
    int today = DateTime.now().day;

    DateTime alarm = DateTime.now().copyWith(
      hour: wakeupTime.value.h,
      minute: wakeupTime.value.m,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    // DateTime sleepTime = DateTime.now().copyWith(
    //   hour: bedtime.value.h,
    //   minute: bedtime.value.m,
    //   second: 0,
    //   millisecond: 0,
    //   microsecond: 0,
    // );
    // if (sleepTime.compareTo(DateTime.now()) <= 0 ||
    //     sleepTime.compareTo(alarm) > 0) {
    //   alarm = alarm.copyWith(day: today + 1);
    // }
    print(alarm);
    return alarm;
  }

  @override
  Future<void> snoozeAlarm() async {
    final alarmSettings = AlarmSettings(
      id: 42,
      dateTime: setTime(),
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: vibrationEnabled.value,
      fadeDuration: 3.0,
      notificationTitle: 'Лучший будильник на свете',
      notificationBody: 'Пора просыпаться, засоня :)',
      enableNotificationOnKill: true,
    );
    final now = DateTime.now();
    Alarm.set(
      alarmSettings: alarmSettings.copyWith(
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
          now.hour,
          now.minute,
          0,
          0,
        ).add(Duration(
          minutes: snoozeTime.value.value,
        )),
      ),
    );
  }
}
