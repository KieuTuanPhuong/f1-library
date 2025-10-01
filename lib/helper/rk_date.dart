import 'package:intl/intl.dart';
import 'package:template/helper/rk_validate.dart';

///
/// Format datetime
///
mixin RkDate {
  static String formatDate(DateTime dateTime, {String format = "dd-MM-yyyy"}) {
    /// yyyy-MM-dd hh:mm:ss
    /// HH:mm dd-MM-yyyy
    /// dd MMM yyyy
    /// dd-MM-yyyy
    /// dd/MM/yyyy
    /// hh:mm
    /// yyyy-MM-dd
    return DateFormat(format).format(dateTime);
  }

  static String formatDateAndTime(DateTime dateTime, {String format = "HH:mm dd/MM/yyyy"}) {
    /// yyyy-MM-dd hh:mm:ss
    /// HH:mm dd-MM-yyyy
    /// dd MMM yyyy
    /// dd-MM-yyyy
    /// dd/MM/yyyy
    /// hh:mm
    /// yyyy-MM-dd
    return DateFormat(format).format(dateTime);
  }

  static String formatDateYMD(DateTime dateTime, {String format = "yyyy-MM-dd"}) {
    /// yyyy-MM-dd hh:mm:ss
    /// HH:mm dd-MM-yyyy
    /// dd MMM yyyy
    /// dd-MM-yyyy
    /// dd/MM/yyyy
    /// hh:mm
    /// yyyy-MM-dd
    return DateFormat(format).format(dateTime);
  }

  static String formatDateTime(DateTime dateTime, {String format = "dd-MM-yyyy hh:mm:ss a"}) {
    /// yyyy-MM-dd hh:mm:ss
    /// HH:mm dd-MM-yyyy
    /// dd MMM yyyy
    /// dd-MM-yyyy
    /// dd/MM/yyyy
    /// hh:mm
    /// yyyy-MM-dd
    return DateFormat(format).format(dateTime);
  }

  static String formatDateTimeMilliseconds(DateTime dateTime, {String format = "dd-MM-yyyy hh:mm:ss.SSS a"}) {
    /// yyyy-MM-dd hh:mm:ss
    /// HH:mm dd-MM-yyyy
    /// dd MMM yyyy
    /// dd-MM-yyyy
    /// dd/MM/yyyy
    /// hh:mm
    /// yyyy-MM-dd
    return DateFormat(format).format(dateTime);
  }

  static DateTime parse(String dateTime) {
    if (!RkValidate.nullOrEmpty(dateTime)) {
      return DateTime.parse(dateTime).toLocal();
    }
    return DateTime.now();
  }

  static int differenceDate({required DateTime startDate, required DateTime endDate}) {
    return endDate.difference(startDate).inDays;
  }

  static int toTimeStamp(DateTime dateTime) {
    return int.parse(dateTime.millisecondsSinceEpoch.toStringAsFixed(0));
  }

  static String toDayMonthYear(String iso8601String) {
    var format = "dd/MM/yyyy";
    if (iso8601String != "") {
      DateTime tempDate = DateTime.parse(iso8601String);
      String result = DateFormat(format).format(tempDate);
      return result;
    } else
      return iso8601String;
  }

  static String toYearMonthDay(String iso8601String) {
    var format = "yyyy/MM/dd";
    if (iso8601String != "") {
      DateTime tempDate = DateTime.parse(iso8601String);
      String result = DateFormat(format).format(tempDate);
      return result;
    } else
      return iso8601String;
  }

  static String DateAndTime = "HH:mm | dd-MM-yyyy";
}
