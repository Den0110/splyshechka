enum SleepTimeType {
  bedtime,
  alarm,
}

extension SleepTimeTypeExt on SleepTimeType {
  String get name {
    switch (this) {
      case SleepTimeType.bedtime:
        return "Отход ко сну";
      case SleepTimeType.alarm:
        return "Будильник";
    }
  }
}
