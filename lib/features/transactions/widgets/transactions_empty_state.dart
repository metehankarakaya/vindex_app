import 'package:flutter/material.dart';
import 'package:vindex_app/core/widgets/empty_holder.dart';

class TransactionsEmptyState extends StatelessWidget {
  const TransactionsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: EmptyHolder(
          iconData: Icons.receipt_long_outlined,
          title: 'No Transactions Yet',
        ),
      ),
    );
  }
}
