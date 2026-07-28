import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatTransactionDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }
}
