import 'package:intl/intl.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';

extension DateTimeExt on DateTime {
  static final DateFormat _dateFormatter = DateFormat('d MMMM y');

  bool isDateEqual(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  String toDateString() {
    return _dateFormatter.format(this);
  }

  String toRusWeekFormat() {
    String result = "";
    switch (weekday) {
      case 1:
        result += "Понедельник";
        break;
      case 2:
        result += "Вторник";
        break;
      case 3:
        result += "Среда";
        break;
      case 4:
        result += "Четверг";
        break;
      case 5:
        result += "Пятница";
        break;
      case 6:
        result += "Суббота";
        break;
      case 7:
        result += "Воскресенье";
        break;
    }
    result += ", " + day.toString() + " ";
    switch (month) {
      case 1:
        result += "января";
        break;
      case 2:
        result += "февраля";
        break;
      case 3:
        result += "марта";
        break;
      case 4:
        result += "апреля";
        break;
      case 5:
        result += "мая";
        break;
      case 6:
        result += "июня";
        break;
      case 7:
        result += "июля";
        break;
      case 8:
        result += "августа";
        break;
      case 9:
        result += "сентября";
        break;
      case 10:
        result += "октября";
        break;
      case 11:
        result += "ноября";
        break;
      case 12:
        result += "декабря";
        break;
    }
    return result;
  }

  String toRusFormat() {
    if (isDateEqual(DateTime.now())) return "Сегодня";
    if (isDateEqual(
      DateTime.now().subtract(
        const Duration(days: 1),
      ),
    )) return "Вчера";
    String result = day.toString() + " ";
    switch (month) {
      case 1:
        result += "января";
        break;
      case 2:
        result += "февраля";
        break;
      case 3:
        result += "марта";
        break;
      case 4:
        result += "апреля";
        break;
      case 5:
        result += "мая";
        break;
      case 6:
        result += "июня";
        break;
      case 7:
        result += "июля";
        break;
      case 8:
        result += "августа";
        break;
      case 9:
        result += "сентября";
        break;
      case 10:
        result += "октября";
        break;
      case 11:
        result += "ноября";
        break;
      case 12:
        result += "декабря";
        break;
    }
    return result;
  }

  /// Обработка возрастного ограничения
  bool isOldEnough(int accessAge) {
    return DateTime(
      year + accessAge,
      month,
      day,
    ).isBefore(DateTime.now());
  }
}

int getHours(double n) {
  return n.truncate();
}

int getMinutes(double n) {
  var s = n;
  return int.parse(s.toString().split('.')[1].substring(0,1));
}

String toHours(int n) {
  var s = n.toString();
  return s.length == 1 ? "0" + s : s;
}

String toMinutes(int n) {
  var s = n.toString();
  return s.length == 1 ? "0" + s : s;
}

double toBack(SleepTime time) {
  double res = time.h + 0;
  if (time.m < 10) {
    res += time.m * 0.1;
  } else {
    res += time.m * 0.01;
  }
  return res;
}
