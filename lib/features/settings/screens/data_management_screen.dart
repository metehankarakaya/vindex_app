import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/constants/app_strings.dart';
import 'package:vindex_app/core/utils/vindex_snackbar.dart';
import 'package:vindex_app/features/recurring/providers/recurrings_provider.dart';
import 'package:vindex_app/features/transactions/providers/transactions_provider.dart';

import '../../../core/widgets/destructive_confirm_dialog.dart';
import '../widgets/settings_list_item.dart';

class DataManagementScreen extends ConsumerWidget {
  const DataManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.dataManagementTitle.tr())),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          color: colorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              SettingsListItem(
                leadingIcon: Icons.receipt_long_outlined,
                title: AppStrings.dataManagementDeleteTransactionsTitle.tr(),
                subtitle: AppStrings.dataManagementDeleteTransactionsSubtitle.tr(),
                trailing: Icon(Icons.delete_outline, color: colorScheme.error),
                showDivider: true,
                onTap: () => _confirmDeleteTransactions(context, ref),
              ),
              SettingsListItem(
                leadingIcon: Icons.repeat_outlined,
                title: AppStrings.dataManagementDeleteRecurringsTitle.tr(),
                subtitle: AppStrings.dataManagementDeleteRecurringsSubtitle.tr(),
                trailing: Icon(Icons.delete_outline, color: colorScheme.error),
                onTap: () => _confirmDeleteRecurrings(context, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDeleteTransactions(BuildContext context, WidgetRef ref) async {
    final confirmed = await DestructiveConfirmDialog.show(
      context,
      title: AppStrings.dataManagementConfirmTitle.tr(),
      body: AppStrings.dataManagementConfirmTransactionsBody.tr(),
      confirmLabel: AppStrings.dataManagementDelete.tr(),
      cancelLabel: AppStrings.dataManagementCancel.tr(),
    );

    if (confirmed && context.mounted) {
      await ref.read(transactionsProvider.notifier).deleteAllTransactions();
      if (context.mounted) {
        VindexSnackBar.showSnackBar(context, AppStrings.dataManagementSuccessTransactions.tr());
      }
    }
  }

  Future<void> _confirmDeleteRecurrings(BuildContext context, WidgetRef ref) async {
    final confirmed = await DestructiveConfirmDialog.show(
      context,
      title: AppStrings.dataManagementConfirmTitle.tr(),
      body: AppStrings.dataManagementConfirmRecurringsBody.tr(),
      confirmLabel: AppStrings.dataManagementDelete.tr(),
      cancelLabel: AppStrings.dataManagementCancel.tr(),
    );

    if (confirmed && context.mounted) {
      await ref.read(recurringsProvider.notifier).deleteAllRecurrings();
      if (context.mounted) {
        VindexSnackBar.showSnackBar(context, AppStrings.dataManagementSuccessRecurrings.tr());
      }
    }
  }
}
