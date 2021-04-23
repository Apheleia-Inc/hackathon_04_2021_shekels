class CurrencyUtils {
  static String formatCents(double cents) {
    double centsToConvert = cents ?? 0;

    return formatCurrency(centsToConvert / 100);
  }

  static String formatCurrency(double money) {
    double moneyToConvert = money ?? 0;

    return '${moneyToConvert < 0 ? '-' : ''}\$${moneyToConvert.abs().toStringAsFixed(2)}';
  }
}
