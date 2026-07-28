import 'package:flutter/material.dart';
import 'package:vindex_app/features/transactions/models/transactions_state.dart';
import 'package:vindex_app/features/transactions/utils/transaction_grouping.dart';
import 'package:vindex_app/features/transactions/widgets/transaction_dismissible_item.dart';

class TransactionsSliverList extends StatelessWidget {
  final TransactionsState state;
  const TransactionsSliverList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final grouped = groupTransactionsByMonth(state.items);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index >= grouped.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: CircularProgressIndicator.adaptive(strokeWidth: 2,),),
              );
            }
            final group = grouped[index];
            return Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    group.label,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                ...group.transactions.map((transaction) => TransactionDismissibleItem(transaction: transaction))
              ],
            );
          },
          childCount: grouped.length + (state.isLoadingMore ? 1 : 0),
        ),
      ),
    );
  }
}
