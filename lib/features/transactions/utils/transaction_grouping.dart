import 'package:intl/intl.dart';
import 'package:vindex_app/core/models/transaction_model.dart';
import 'package:vindex_app/features/transactions/models/month_group.dart';

List<MonthGroup> groupTransactionsByMonth(List<TransactionModel> items) {
  final Map<String, List<TransactionModel>> map = {};

  for (final transaction in items) {
    final key = DateFormat('yyyy-MM').format(transaction.transactionDate);
    map.putIfAbsent(key, () => []).add(transaction);
  }

  return map.entries.map((entry) {
    final date = DateFormat('yyyy-MM').parse(entry.key);
    final label = DateFormat('MMMM yyyy').format(date);
    return MonthGroup(label: label, transactions: entry.value);
  }).toList();
}
