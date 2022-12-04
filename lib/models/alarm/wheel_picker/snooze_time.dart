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
      default: return "$value min";
    }
  }

}