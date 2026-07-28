import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vindex_app/core/models/recurring_model.dart';
import 'package:vindex_app/core/models/transaction_type.dart';
import 'package:vindex_app/core/providers/currency_formatter_provider.dart';
import 'package:vindex_app/core/utils/category_utils.dart';
import 'package:vindex_app/core/utils/frequency_utils.dart';

class RecurringListItem extends ConsumerWidget {
  final RecurringModel recurring;
  final VoidCallback onLongPress;

  const RecurringListItem({super.key, required this.recurring, required this.onLongPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = ref.watch(currencyFormatterProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final locale = Localizations.localeOf(context);
    final formattedAmount = formatter.format(recurring.amount);

    final bool isExpense = recurring.type == TransactionType.expense;
    final categoryColor = colorForCategory(recurring.category);
    final Color amountColor = isExpense ? colorScheme.error : const Color(0xFF10B981);

    String formatDateRange(DateTime startDate, DateTime? endDate) {
      final dateFormat = DateFormat('dd MMMM yyyy', locale.toString());
      final start = dateFormat.format(startDate);
      if (endDate == null) {
        return '$start - ∞';
      }
      return '$start - ${dateFormat.format(endDate)}';
    }

    return ListTile(
      onLongPress: onLongPress,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: categoryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(iconForCategory(recurring.category), color: categoryColor, size: 24),
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              recurring.title.trim().isEmpty ? labelForCategory(recurring.category) : recurring.title,
              style: TextStyle(fontWeight: FontWeight.w600, color: colorScheme.onSurface),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              labelForFrequency(recurring.frequency),
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(
        formatDateRange(recurring.startDate, recurring.endDate),
        style: TextStyle(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7)),
      ),
      trailing: SizedBox(
        width: 100,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerRight,
          child: Text(
            '${isExpense ? '-' : '+'}$formattedAmount',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: amountColor),
          ),
        ),
      ),
    );
  }
}
