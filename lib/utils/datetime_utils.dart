import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class DateTimeUtils {
  static String getDateString(DateTime dateTime) {
    DateTime dateTimeToFormat = dateTime ?? DateTime.now();
    return DateFormat('yyyy-MM-dd').format(dateTimeToFormat);
  }

  static String getDateTimeString(DateTime dateTime) {
    DateTime dateTimeToFormat = dateTime ?? DateTime.now();
    return DateFormat('MM/dd/yyyy, HH:mm AA').format(dateTimeToFormat);
  }

  static String getDurationAgoString(Duration duration) {
    if (duration.inDays > 0) {
      return duration.inDays.toString() + 'd ago';
    }

    if (duration.inHours > 0) {
      return duration.inHours.toString() + 'h ago';
    }

    if (duration.inMinutes > 0) {
      return duration.inMinutes.toString() + 'm ago';
    }

    return 'Just now';
  }

  static int getUnixFromString(String dateTimeStr) {
    try {
      final date = DateTime.parse(dateTimeStr);
      return date.millisecondsSinceEpoch;
    } catch (e) {
      Logger().e('Cannot parse string ${dateTimeStr}');
      return 0;
    }
  }
}
