enum SleepTimeType {
  bedtime,
  alarm,
}

extension SleepTimeTypeExt on SleepTimeType {
  String get name {
    switch (this) {
      case SleepTimeType.bedtime:
        return "Bedtime";
      case SleepTimeType.alarm:
        return "Alarm";
    }
  }
}
