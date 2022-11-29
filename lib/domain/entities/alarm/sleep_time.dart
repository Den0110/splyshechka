class SleepTime {
  const SleepTime({required this.h, required this.m});

  final int h;
  final int m;

  SleepTime operator -(SleepTime another) {
    int val = this.h * 60 - another.h * 60 + this.m - another.m;
    if (val < 0) {
      val = 24*60+val;
    }

    int h = val ~/ 60;
    int m = val % 60;
    return SleepTime(h: h, m: m);
  }

  SleepTime operator +(SleepTime another) {
    int h = this.h + another.h;
    int m = this.m + another.m;
    h += m ~/ 60;
    m %= 60;
    return SleepTime(h: h, m: m);
  }

  @override
  String toString() {
    return "$h h $m m";
  }

  String toStringWithColon() {
    return "$h:${m <= 9 ?'0$m': m}";
  }
}