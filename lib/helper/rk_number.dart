import 'package:template/helper/rk_validate.dart';

///
/// Parse string to number
///
class RkNumber {
  ///
  /// Parse to double
  ///
  static double parseDouble(dynamic number, {double fault = 0.0}) {
    if (number != null) {
      // Double
      if (number is double)
        return number;
      // Int
      else if (number is int)
        return number * 1.0;
      else if (number is String) {
        // String double
        if (number.indexOf('.') >= 0) {
          return double.parse(number);
        } else {
          // May be string int
          return int.parse(number) * 1.0;
        }
      }
    }
    return fault;
  }

  /// Parse int to bool
  static bool parseBool(int value) {
    if (value == 1) {
      return true;
    } else {
      return false;
    }
  }

  ///
  /// Parse to int
  ///
  static int parseInt(dynamic number, {int fault = 0}) {
    if (RkValidate.nullOrEmpty(number) == false) {
      // Double
      if (number is double)
        return number.round();
      // Int
      else if (number is int)
        return number;
      else if (number is String) {
        // String double
        if (number.indexOf('.') >= 0) {
          return double.parse(number).round();
        } else {
          // May be string int
          return int.parse(number);
        }
      }
    }
    return fault;
  }
}
