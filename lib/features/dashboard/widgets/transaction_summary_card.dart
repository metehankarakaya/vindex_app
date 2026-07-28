import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/models/transaction_type.dart';
import '../providers/balance_visibility_provider.dart';
import '../providers/dashboard_summary_provider.dart';

class TransactionSummaryCard extends ConsumerWidget {
  final TransactionType type;
  const TransactionSummaryCard({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardSummaryProvider);
    final isVisible = ref.watch(balanceVisibilityProvider);
    final isIncome = type == TransactionType.income;
    final color = isIncome ? Colors.green : Colors.red;
    final icon = isIncome ? Icons.arrow_upward_outlined : Icons.arrow_downward_outlined;
    final label = isIncome ? AppStrings.dashboardIncome.tr() : AppStrings.dashboardExpense.tr();

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
                    final displayText = isVisible ? '${amount.toStringAsFixed(2)} ₺' : '****** ₺';
                    return Text(
                      displayText,
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
