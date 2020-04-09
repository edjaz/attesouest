import 'package:intl/intl.dart';

class DateUtils {
  static String dateToString(DateTime date) {
    return NumberFormat('00', 'fr').format(date.day) +
        '/' +
        NumberFormat('00', 'fr').format(date.month) +
        '/' +
        date.year.toString();
  }

  static String dateTimeToString(DateTime date, String sep) {
    return NumberFormat('00', 'fr').format(date.day) +
        '/' +
        NumberFormat('00', 'fr').format(date.month) +
        '/' +
        date.year.toString() +
        ' ' +
        sep +
        ' ' +
        NumberFormat('00', 'fr').format(date.hour) +
        ':' +
        NumberFormat('00', 'fr').format(date.minute);
  }
}
