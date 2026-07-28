import 'package:vindex_app/core/models/transaction_model.dart';

class MonthGroup {
  final String label;
  final List<TransactionModel> transactions;
  const MonthGroup({required this.label, required this.transactions});
}
