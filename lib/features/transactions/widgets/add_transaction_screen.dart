import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/constants/app_colors.dart';
import 'package:vindex_app/core/constants/app_strings.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_model.dart';
import 'package:vindex_app/core/models/transaction_type.dart';
import 'package:vindex_app/core/providers/currency_formatter_provider.dart';
import 'package:vindex_app/core/utils/currency_input_formatter.dart';
import 'package:vindex_app/core/utils/vindex_snackbar.dart';
import 'package:vindex_app/core/widgets/category_selector.dart';
import 'package:vindex_app/core/widgets/save_transaction_button.dart';
import 'package:vindex_app/core/widgets/transaction_type_selector.dart';
import 'package:vindex_app/features/transactions/providers/transactions_provider.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _amountController;

  bool _isSaving = false;
  int? _lastQuickAmount;

  TransactionType _selectedType = TransactionType.expense;
  TransactionCategory? _selectedCategory;

  late NumberFormat _formatter;

  bool get _isFormValid {
    final amount = _formatter.tryParse(_amountController.text.trim());
    return _selectedCategory != null && amount != null && amount > 0 && !_isSaving;
  }

  void _onQuickAmount(int amountTL) {
    setState(() {
      final double newValue;
      if (_lastQuickAmount == amountTL) {
        final current = _formatter.tryParse(_amountController.text.trim()) ?? 0;
        newValue = current.toDouble() + amountTL;
      } else {
        newValue = amountTL.toDouble();
      }
      _lastQuickAmount = amountTL;
      _amountController.text = _formatter.format(newValue);
    });
  }

  Future<void> _saveTransaction() async {
    final amount = _formatter.tryParse(_amountController.text.trim());
    if (amount == null || _selectedCategory == null) return;

    setState(() => _isSaving = true);

    try {
      final now = DateTime.now();
      final transaction = TransactionModel(
        title: _titleController.text.trim(),
        amount: amount.toDouble(),
        category: _selectedCategory!,
        type: _selectedType,
        currency: 'TRY',
        transactionDate: DateTime(now.year, now.month, now.day),
      );

      await ref.read(transactionsProvider.notifier).createTransaction(transaction);

      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        VindexSnackBar.showSnackBar(context, AppStrings.transactionsSaveError.tr());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _formatter = ref.watch(currencyFormatterProvider);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Color amountColor = _selectedType == TransactionType.expense ? colorScheme.error : AppColors.income;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            TextField(
              controller: _amountController,
              onChanged: (_) => setState(() {}),
              textAlign: TextAlign.center,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                letterSpacing: -2,
                color: amountColor,
              ),
              decoration: InputDecoration(
                hintText: "${_formatter.currencySymbol}0,00",
                hintStyle: TextStyle(color: amountColor.withValues(alpha: 0.2)),
                border: InputBorder.none,
              ),
              inputFormatters: [CurrencyInputFormatter(_formatter)],
            ),
            const SizedBox(height: 8),
            Row(
              children: [50, 100, 200, 1000].map((amount) {
                final isActive = _lastQuickAmount == amount;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: OutlinedButton(
                      onPressed: () => _onQuickAmount(amount),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: isActive ? amountColor : colorScheme.onSurfaceVariant,
                        side: BorderSide(
                          color: isActive ? amountColor.withValues(alpha: 0.6) : colorScheme.outlineVariant,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('$amount ₺', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TransactionTypeSelector(
              selectedType: _selectedType,
              onTypeSelected: (type) => setState(() => _selectedType = type),
            ),
            const SizedBox(height: 24),
            CategorySelector(
              selectedCategory: _selectedCategory,
              onCategorySelected: (category) => setState(() => _selectedCategory = category),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                counterText: "",
                hintText: AppStrings.transactionsDescriptionHint.tr(),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.edit_note),
              ),
            ),
            const SizedBox(height: 24),
            SaveTransactionButton(
              label: AppStrings.transactionsSave.tr(),
              isLoading: _isSaving,
              icon: Icons.check_circle_outline,
              onPressed: _isFormValid ? _saveTransaction : null,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
