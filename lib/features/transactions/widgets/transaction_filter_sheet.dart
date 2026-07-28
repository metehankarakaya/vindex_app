import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_type.dart';
import 'package:vindex_app/core/utils/category_utils.dart';
import 'package:vindex_app/features/transactions/models/transaction_filter.dart';
import 'package:vindex_app/features/transactions/providers/transactions_provider.dart';

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

  @override
  void initState() {
    super.initState();
    final currentFilter = ref.read(transactionsProvider).filter;
    _category = currentFilter.category;
    _type = currentFilter.type;
    _startDate = currentFilter.startDate;
    _endDate = currentFilter.endDate;
    _minAmountController = TextEditingController(text: currentFilter.minAmount?.toString() ?? '');
    _maxAmountController = TextEditingController(text: currentFilter.maxAmount?.toString() ?? '');
    _keywordController = TextEditingController(text: currentFilter.keyword ?? '');
  }

  @override
  void dispose() {
    _minAmountController.dispose();
    _maxAmountController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  Future<void> _pickDateRange() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : null,
    );
    if (range != null) {
      setState(() {
        _startDate = range.start;
        _endDate = range.end;
      });
    }
  }

  void _apply() {
    final filter = TransactionFilter(
      category: _category,
      type: _type,
      startDate: _startDate,
      endDate: _endDate,
      minAmount: double.tryParse(_minAmountController.text),
      maxAmount: double.tryParse(_maxAmountController.text),
      keyword: _keywordController.text.trim().isEmpty ? null : _keywordController.text.trim(),
    );
    ref.read(transactionsProvider.notifier).applyFilter(filter);
    Navigator.of(context).pop();
  }

  void _clear() {
    ref.read(transactionsProvider.notifier).clearFilter();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filters', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            DropdownButtonFormField<TransactionCategory>(
              initialValue: _category,
              decoration: const InputDecoration(labelText: 'Category'),
              items: TransactionCategory.values
                  .map((c) => DropdownMenuItem(value: c, child: Text(labelForCategory(c))))
                  .toList(),
              onChanged: (value) => setState(() => _category = value),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<TransactionType>(
              initialValue: _type,
              decoration: const InputDecoration(labelText: 'Type'),
              items: TransactionType.values
                  .map((t) => DropdownMenuItem(value: t, child: Text(t.name)))
                  .toList(),
              onChanged: (value) => setState(() => _type = value),
            ),
            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: _pickDateRange,
              icon: const Icon(Icons.date_range),
              label: Text(
                _startDate != null && _endDate != null
                    ? '${_startDate!.day}/${_startDate!.month} - ${_endDate!.day}/${_endDate!.month}'
                    : 'Select date range',
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minAmountController,
                    decoration: const InputDecoration(labelText: 'Min amount'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _maxAmountController,
                    decoration: const InputDecoration(labelText: 'Max amount'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _keywordController,
              decoration: const InputDecoration(labelText: 'Keyword'),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: _clear, child: const Text('Clear')),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(onPressed: _apply, child: const Text('Apply')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
