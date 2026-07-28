import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vindex_app/core/constants/app_colors.dart';
import 'package:vindex_app/core/constants/app_strings.dart';
import 'package:vindex_app/core/models/transaction_type.dart';

class TransactionTypeFilterSelector extends StatelessWidget {
  final TransactionType? selectedType;
  final ValueChanged<TransactionType?> onTypeSelected;

  const TransactionTypeFilterSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Color activeColor = switch (selectedType) {
      TransactionType.expense => colorScheme.error,
      TransactionType.income => AppColors.income,
      null => colorScheme.primary,
    };

    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<TransactionType?>(
        segments: [
          ButtonSegment(value: null, label: Text(AppStrings.filtersTypeAll.tr())),
          ButtonSegment(
            value: TransactionType.expense,
            label: Text(AppStrings.dashboardExpense.tr()),
            icon: const Icon(Icons.arrow_downward, size: 16),
          ),
          ButtonSegment(
            value: TransactionType.income,
            label: Text(AppStrings.dashboardIncome.tr()),
            icon: const Icon(Icons.arrow_upward, size: 16),
          ),
        ],
        selected: {selectedType},
        onSelectionChanged: (newSelection) => onTypeSelected(newSelection.first),
        style: SegmentedButton.styleFrom(
          side: BorderSide(color: colorScheme.outlineVariant),
          selectedBackgroundColor: activeColor.withValues(alpha: 0.1),
          selectedForegroundColor: activeColor,
        ),
      ),
    );
  }
}
