import 'package:intl/intl.dart';
import 'package:template/helper/rk_validate.dart';

import '../localization/translation_helper.dart';

///
/// handler string
///
class RkString {
  static String cut(String text, {int length = 50}) {
    String content = text;
    if (text.length > length) {
      content = '${text.substring(0, length)}...';
      return content;
    }
    return content;
  }

  ///
  /// Dinh dang ten file da upload
  ///
  static String getFileNameFromUrl(String text) {
    if (text.isNotEmpty && text.toString() != 'null') {
      final arrayNameSplit = text.toString().split('/');
      return arrayNameSplit[arrayNameSplit.length - 1];
    }
    return '';
  }

  ///
  /// Get the value price from string
  ///
  static String getNumberString(dynamic value) {
    if (value == null || value.toString().isEmpty || value.toString() == 'null' || (value is List && value.isEmpty == true)) return '0';
    final String result = value.toString().replaceAll('.', '').replaceAll(',', '').replaceAll('null', '');
    if (result == '') return '0';
    return result;
  }

  ///
  ///  format number, example: 150.000
  ///
  static String formatNumber(num? value, {bool isDecimal = true}) {
    if (value != null) {
      final NumberFormat numberFormat = NumberFormat(isDecimal ? "#,##0.00" : "#,##0", TranslationHelper.getLocaleCode());
      return numberFormat.format(value);
    } else {
      return '';
    }
  }

  static String getNumberFromString(String string) {
    return string.replaceAll(RegExp('[^0-9]'), '');
  }

  static String toSlug(String str, {String char = '-'}) {
    if (RkValidate.nullOrEmpty(str)) return '';
    String _str = str;
    _str = _str.toLowerCase();
    _str = _str.replaceAll(RegExp('[àáạảãâầấậẩẫăằắặẳẵ]'), 'a');
    _str = _str.replaceAll(RegExp('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/g'), 'e');
    _str = _str.replaceAll(RegExp('/(ì|í|ị|ỉ|ĩ)/g'), 'i');
    _str = _str.replaceAll(RegExp('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/g'), 'o');
    _str = _str.replaceAll(RegExp('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/g'), 'u');
    _str = _str.replaceAll(RegExp('/(ỳ|ý|ỵ|ỷ|ỹ)/g'), 'y');
    _str = _str.replaceAll(RegExp('/(đ)/g'), 'd');
    _str = _str.replaceAll(RegExp('/([^0-9a-z-\s])/g'), '');
    _str = _str.replaceAll(RegExp('/(\s+)/g'), char);
    final regexRemoveDuplicate = RegExp('$char+');
    return _str.replaceAll(regexRemoveDuplicate, char);
  }
}
