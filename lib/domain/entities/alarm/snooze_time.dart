enum SnoozeTime {
  off(0),
  min5(5),
  min10(10),
  min15(15),
  min25(25);

  const SnoozeTime(this.value);

  final int value;

  @override
  String toString() {
    switch (this) {
      case SnoozeTime.off:
        return "Off";
      default:
        return "$value min";
    }
  }

  static SnoozeTime fromValue(int value) {
    switch (value) {
      case 0:
        return SnoozeTime.off;
      case 5:
        return SnoozeTime.min5;
      case 10:
        return SnoozeTime.min10;
      case 15:
        return SnoozeTime.min15;
      case 25:
        return SnoozeTime.min25;
    }
    return SnoozeTime.off;
  }
}
