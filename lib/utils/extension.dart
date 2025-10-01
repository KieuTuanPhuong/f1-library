import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  DateTime getFirstDateOfMonth() {
    return DateTime(year, month);
  }

  DateTime getLastDateOfMonth() {
    return DateTime(year, month + 1, 0);
  }

  DateTime getFirstDateOfWeek() {
    return subtract(Duration(days: weekday - 1));
  }

  DateTime getLastDateOfWeek() {
    return add(Duration(days: DateTime.daysPerWeek - weekday));
  }

  bool isSameDay(DateTime dateTime) {
    return dateTime.month == month && dateTime.year == year && dateTime.day == day;
  }

  String formatDateTime(String locale) {
    if (locale == 'VN') {
      return 'Tháng $month, $year';
    }
    return DateFormat('MMMM yyyy').format(this);
  }

  String toWeekDayName(String locale) {
    if (locale == 'VN') {
      if (weekday == DateTime.sunday) {
        return 'CN';
      }
      return 'T${weekday + 1}';
    } else {
      return DateFormat('EE').format(this).toUpperCase();
    }
  }
}
