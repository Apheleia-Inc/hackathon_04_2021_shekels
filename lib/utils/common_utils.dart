import 'package:intl/intl.dart';

class CommonUtils {
  static String formatDecimalPercent(double decimalPercent) {
    double decimalToConvert = decimalPercent ?? 0;

    return '${decimalToConvert < 0 ? '-' : ''}${(decimalToConvert * 100).abs().toStringAsFixed(2)}%';
  }

  static String formatLongNumber(double number) {
    if (number >= 100 && number <= 1000) {
      // Worakround because .compactCurrency() doesn't display 3 digits decimal
      // as we expected
      return number.toStringAsFixed(2);
    }

    return NumberFormat.compactCurrency(
      name: '',
      symbol: '',
      decimalDigits: 2,
    ).format(number);
  }
}
