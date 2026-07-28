import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/balance_visibility_provider.dart';
import '../providers/dashboard_summary_provider.dart';

class BalanceCard extends ConsumerWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardSummaryProvider);
    final isVisible = ref.watch(balanceVisibilityProvider);

    return Row(
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: summaryAsync.when(
              data: (summary) => Text(
                isVisible ? '${summary.balance.toStringAsFixed(2)} ₺' : '****** ₺',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
              loading: () => const SizedBox(
                height: 32,
                width: 32,
                child: CircularProgressIndicator.adaptive(strokeWidth: 3),
              ),
              error: (error, stackTree) => Text(
                "Error",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              )
            )
          ),
        ),
        const SizedBox(width: 16,),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () => ref.read(balanceVisibilityProvider.notifier).toggle(),
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            visualDensity: VisualDensity.compact,
          ),
        )
      ],
    );
  }
}
