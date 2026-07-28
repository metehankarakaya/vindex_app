import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/transaction_type.dart';
import '../providers/dashboard_summary_provider.dart';

class TransactionSummaryCard extends ConsumerWidget {
  final TransactionType type;
  const TransactionSummaryCard({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardSummaryProvider);
    final isIncome = type == TransactionType.income;
    final color = isIncome ? Colors.green : Colors.red;
    final icon = isIncome ? Icons.arrow_upward_outlined : Icons.arrow_downward_outlined;
    final label = isIncome ? 'Income' : 'Expense';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, size: 32, color: color),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.labelMedium),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: summaryAsync.when(
                  data: (summary) {
                    final amount = isIncome ? summary.totalIncome : summary.totalExpense;
                    return Text(
                      '${amount.toStringAsFixed(2)} ₺',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  loading: () => const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (error, stackTree) => const Text('-'),
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
