import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatTransactionDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  static String formatFullDate(DateTime date, Locale locale) {
    return DateFormat('d MMMM yyyy', locale.languageCode).format(date);
  }
}
