import 'package:intl/intl.dart';

class AppTextFormatter {
  static String formatCurrency(double value, String currency) =>
      NumberFormat.currency(
        symbol: currency,
      ).format(value);

  static String decimalPattern(num value) =>
      NumberFormat.decimalPattern().format(value);
}
