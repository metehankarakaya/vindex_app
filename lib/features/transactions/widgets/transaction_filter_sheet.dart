import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/constants/app_strings.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_type.dart';
import 'package:vindex_app/core/providers/currency_formatter_provider.dart';
import 'package:vindex_app/core/utils/currency_input_formatter.dart';
import 'package:vindex_app/core/widgets/category_selector.dart';
import 'package:vindex_app/core/widgets/date_picker_field.dart';
import 'package:vindex_app/core/widgets/save_transaction_button.dart';
import 'package:vindex_app/features/transactions/models/transaction_filter.dart';
import 'package:vindex_app/features/transactions/providers/transactions_provider.dart';
import 'package:vindex_app/features/transactions/widgets/transaction_type_filter_selector.dart';

class TransactionFilterSheet extends ConsumerStatefulWidget {
  const TransactionFilterSheet({super.key});

  @override
  ConsumerState<TransactionFilterSheet> createState() => _TransactionFilterSheetState();
}

class _TransactionFilterSheetState extends ConsumerState<TransactionFilterSheet> {
  TransactionCategory? _category;
  TransactionType? _type;
  DateTime? _startDate;
  DateTime? _endDate;
  late final TextEditingController _minAmountController;
  late final TextEditingController _maxAmountController;
  late final TextEditingController _keywordController;
  late NumberFormat _formatter;
  late final TransactionFilter _initialFilter;

  @override
  void initState() {
    super.initState();
    final currentFilter = ref.read(transactionsProvider).filter;
    _category = currentFilter.category;
    _type = currentFilter.type;
    _startDate = currentFilter.startDate;
    _endDate = currentFilter.endDate;
    _minAmountController = TextEditingController();
    _maxAmountController = TextEditingController();
    _keywordController = TextEditingController(text: currentFilter.keyword ?? '');
    _initialFilter = currentFilter;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _formatter = ref.watch(currencyFormatterProvider);
    if (ref.read(transactionsProvider).filter.minAmount != null && _minAmountController.text.isEmpty) {
      _minAmountController.text = _formatter.format(ref.read(transactionsProvider).filter.minAmount);
    }
    if (ref.read(transactionsProvider).filter.maxAmount != null && _maxAmountController.text.isEmpty) {
      _maxAmountController.text = _formatter.format(ref.read(transactionsProvider).filter.maxAmount);
    }
  }

  @override
  void dispose() {
    _minAmountController.dispose();
    _maxAmountController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  void _apply() {
    final filter = TransactionFilter(
      category: _category,
      type: _type,
      startDate: _startDate,
      endDate: _endDate,
      minAmount: _formatter.tryParse(_minAmountController.text.trim())?.toDouble(),
      maxAmount: _formatter.tryParse(_maxAmountController.text.trim())?.toDouble(),
      keyword: _keywordController.text.trim().isEmpty ? null : _keywordController.text.trim(),
    );
    ref.read(transactionsProvider.notifier).applyFilter(filter);
    Navigator.of(context).pop();
  }

  bool get _hasChanges {
    final current = TransactionFilter(
      category: _category,
      type: _type,
      startDate: _startDate,
      endDate: _endDate,
      minAmount: _formatter.tryParse(_minAmountController.text.trim())?.toDouble(),
      maxAmount: _formatter.tryParse(_maxAmountController.text.trim())?.toDouble(),
      keyword: _keywordController.text.trim().isEmpty ? null : _keywordController.text.trim(),
    );
    return current != _initialFilter;
  }

  bool get _isAmountRangeValid {
    final min = _formatter.tryParse(_minAmountController.text.trim());
    final max = _formatter.tryParse(_maxAmountController.text.trim());
    if (min == null || max == null) return true;
    return min <= max;
  }

  void _clear() {
    ref.read(transactionsProvider.notifier).clearFilter();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 48),
                Text(AppStrings.filtersTitle.tr(), style: theme.textTheme.titleLarge),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.filtersType.tr(),
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TransactionTypeFilterSelector(
              selectedType: _type,
              onTypeSelected: (value) => setState(() => _type = value),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.filtersCategory.tr(),
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            CategorySelector(
              selectedCategory: _category,
              onCategorySelected: (value) => setState(() => _category = value),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.filtersDateRange.tr(),
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DatePickerField(
              label: AppStrings.filtersStartDate.tr(),
              selectedDate: _startDate,
              firstDate: DateTime(2020),
              hintText: AppStrings.filtersStartDate.tr(),
              isClearable: true,
              onDateSelected: (picked) => setState(() {
                _startDate = picked;
                if (_endDate != null && picked != null && _endDate!.isBefore(picked)) {
                  _endDate = null;
                }
              }),
            ),
            const SizedBox(height: 12),
            DatePickerField(
              label: AppStrings.filtersEndDate.tr(),
              selectedDate: _endDate,
              firstDate: _startDate ?? DateTime(2020),
              hintText: AppStrings.filtersEndDate.tr(),
              isClearable: true,
              onDateSelected: (picked) => setState(() => _endDate = picked),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minAmountController,
                    onChanged: (_) => setState(() {}),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [CurrencyInputFormatter(_formatter)],
                    decoration: InputDecoration(
                      labelText: AppStrings.filtersMinAmount.tr(),
                      filled: true,
                      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _maxAmountController,
                    onChanged: (_) => setState(() {}),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [CurrencyInputFormatter(_formatter)],
                    decoration: InputDecoration(
                      labelText: AppStrings.filtersMaxAmount.tr(),
                      filled: true,
                      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (!_isAmountRangeValid) ...[
              const SizedBox(height: 8),
              Text(
                AppStrings.filtersInvalidAmountRange.tr(),
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.error),
              ),
            ],
            const SizedBox(height: 20),
            TextField(
              controller: _keywordController,
              decoration: InputDecoration(
                hintText: AppStrings.filtersKeywordHint.tr(),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clear,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(AppStrings.filtersClear.tr()),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SaveTransactionButton(
                    label: AppStrings.filtersApply.tr(),
                    onPressed: (_isAmountRangeValid && _hasChanges) ? _apply : null,
                    icon: Icons.filter_list,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
