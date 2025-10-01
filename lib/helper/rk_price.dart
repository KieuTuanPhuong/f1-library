import 'package:intl/intl.dart';

///
/// Convert currency
///
mixin RkPrice {
  static String currencyConverterVND(double value, {String? locale = 'vi-VN'}) {
    return NumberFormat.currency(name: "", decimalDigits: 0, locale: locale).format(value).replaceAll(',', '.');
  }

  static String getDiscountPercent({required double price, required double priceAtSale}) {
    try {
      final discount = (((price - priceAtSale) / price) * 100).toInt().toString();
      return '-$discount%';
    } catch (e) {
      return '0%';
    }
  }
}
