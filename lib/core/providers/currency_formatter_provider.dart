import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_formatter_provider.g.dart';

@riverpod
NumberFormat currencyFormatter(Ref ref) {
  return NumberFormat.currency(locale: 'tr_TR', symbol: '₺', decimalDigits: 2);
}
