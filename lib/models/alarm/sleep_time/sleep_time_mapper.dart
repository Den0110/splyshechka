import 'package:my_pillow/models/alarm/sleep_time/sleep_time.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

abstract class SleepTimeMapper {
  static SleepTime toTime(PickedTime pickedTime) =>
      SleepTime(h: pickedTime.h, m: pickedTime.m);
  static PickedTime toPickedTime(SleepTime time) =>
      PickedTime(h: time.h, m: time.m);
}
