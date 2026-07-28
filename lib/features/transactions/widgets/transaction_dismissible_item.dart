import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/models/transaction_model.dart';
import 'package:vindex_app/features/transactions/providers/transactions_provider.dart';
import 'package:vindex_app/features/transactions/widgets/transaction_list_item.dart';

import '../../../core/constants/app_strings.dart';

class TransactionDismissibleItem extends ConsumerWidget {
  final TransactionModel transaction;
  const TransactionDismissibleItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dismissible(
      key: Key(transaction.id!),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => _confirmDelete(context, ref),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.delete_outline, color: colorScheme.error),
      ),
      child: TransactionListItem(transaction: transaction),
    );
  }

  Future<bool> _confirmDelete(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(transactionsProvider.notifier).deleteTransaction(transaction.id!);
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 409 && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppStrings.transactionsRecurringDeleteBlocked.tr()
            ),
          ),
        );
      }
      return false;
    }
  }
}
