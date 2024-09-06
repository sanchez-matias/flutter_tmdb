import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    return NumberFormat.compactCurrency(
            decimalDigits: decimals, symbol: '', locale: 'en')
        .format(number);
  }

  static String? longDate(DateTime? date, [String region = 'en']) {
    if (date == null) return null;

    final format = DateFormat.yMMMMd(region);
    return format.format(date);
  }

  static String? longDateNoYear(DateTime? date, [String region = 'en']) {
    if (date == null) return null;

    final format = DateFormat.MMMMd(region);
    return format.format(date);
  }

  static String? shortDate(DateTime? date, [String region = 'en']) {
    if (date == null) return null;

    final format = DateFormat.yMd(region);
    return format.format(date);
  }

  static String? shortDateNoYear(DateTime? date, [String region = 'en']) {
    if (date == null) return null;
    
    final format = DateFormat.Md(region);
    return format.format(date);
  }
}
