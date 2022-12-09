import 'package:intl/intl.dart';

class DateTimeManager {
  static final DateTime minDate = DateTime(1970);
  static final DateTime maxDate = DateTime(2900);

  static DateTime parseDataTimeWithMinimum(String formattedString) =>
      parseDataTimeWithDefault(formattedString, minDate);

  static DateTime parseDataTimeWithDefault(
    String formattedString,
    DateTime defaultDateTime,
  ) {
    try {
      return DateTime.parse(formattedString);
    } catch (_) {
      return defaultDateTime;
    }
  }

  static DateTime parseDataTime(String formattedString) =>
      DateTime.parse(formattedString);

  static bool isWithin(
    DateTime value,
    DateTime from,
    DateTime to,
  ) =>
      !(value.isBefore(from) || value.isAfter(to));

  static String formatDate(
    DateTime value,
    String format,
  ) =>
      DateFormat(format).format(value);
}
