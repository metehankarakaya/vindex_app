import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/models/transaction_model.dart';
import 'package:vindex_app/core/models/transaction_type.dart';
import 'package:vindex_app/core/providers/currency_formatter_provider.dart';
import 'package:vindex_app/core/utils/category_utils.dart';
import 'package:vindex_app/core/utils/date_formatter.dart';
import 'package:vindex_app/features/transactions/widgets/category_icon_widget.dart';

class TransactionListItem extends ConsumerWidget {
  final TransactionModel transaction;
  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = ref.watch(currencyFormatterProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formattedAmount = formatter.format(transaction.amount);

    final bool isExpense = transaction.type == TransactionType.expense;
    final Color amountColor = isExpense ? colorScheme.error : Colors.green;

    return ListTile(
      leading: CategoryIconWidget(category: transaction.category),
      trailing: SizedBox(
        width: 100,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerRight,
          child: Text(
            '${isExpense ? '-' : '+'}$formattedAmount',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: amountColor,
            ),
          ),
        ),
      ),
      title: Text(
        transaction.title.trim().isEmpty
          ? labelForCategory(transaction.category)
          : transaction.title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        DateFormatter.formatTransactionDate(transaction.transactionDate),
        style: TextStyle(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
