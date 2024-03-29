import 'package:rxdart/subjects.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/domain/entities/alarm/snooze_time.dart';

abstract class AlarmRepository {
  final remindToChange = BehaviorSubject<bool>();
  final bedtime = BehaviorSubject<SleepTime>();
  final wakeupTime = BehaviorSubject<SleepTime>();
  final remindToSleep = BehaviorSubject<bool>();
  final alarmEnabled = BehaviorSubject<bool>();
  final vibrationEnabled = BehaviorSubject<bool>();
  final alarmVolume = BehaviorSubject<double>();
  final snoozeTime = BehaviorSubject<SnoozeTime>();

  void setRemindToChange(bool value);

  void setBedtime(SleepTime value);

  void setWakeupTime(SleepTime value);

  void setRemindToSleep(bool value);

  void setAlarmEnabled(bool value);

  void setVibrationEnabled(bool value);

  void setAlarmVolume(double value);

  void setSnoozeTime(SnoozeTime value);

  Future<void> setAlarm();

  Future<void> snoozeAlarm();
}
