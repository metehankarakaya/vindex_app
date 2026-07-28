import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vindex_app/core/constants/app_colors.dart';
import 'package:vindex_app/core/constants/app_strings.dart';
import 'package:vindex_app/core/models/frequency.dart';
import 'package:vindex_app/core/models/recurring_model.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_type.dart';
import 'package:vindex_app/core/providers/currency_formatter_provider.dart';
import 'package:vindex_app/core/utils/currency_input_formatter.dart';
import 'package:vindex_app/core/utils/vindex_snackbar.dart';
import 'package:vindex_app/core/widgets/category_selector.dart';
import 'package:vindex_app/core/widgets/date_picker_field.dart';
import 'package:vindex_app/core/widgets/frequency_selector.dart';
import 'package:vindex_app/core/widgets/save_transaction_button.dart';
import 'package:vindex_app/core/widgets/transaction_type_selector.dart';
import 'package:vindex_app/features/recurring/services/recurring_service.dart';

class AddRecurringTransactionScreen extends ConsumerStatefulWidget {
  const AddRecurringTransactionScreen({super.key});

  @override
  ConsumerState<AddRecurringTransactionScreen> createState() => _AddRecurringTransactionScreenState();
}

class _AddRecurringTransactionScreenState extends ConsumerState<AddRecurringTransactionScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _amountController;

  bool _isSaving = false;
  int? _lastQuickAmount;

  TransactionType _selectedType = TransactionType.expense;
  TransactionCategory? _selectedCategory;
  Frequency? _selectedFrequency;
  DateTime? _startDate;
  DateTime? _endDate;

  late NumberFormat _formatter;

  bool get _isFormValid {
    final amount = _formatter.tryParse(_amountController.text.trim());
    final title = _titleController.text.trim();
    return title.isNotEmpty &&
        _selectedCategory != null &&
        _selectedFrequency != null &&
        _startDate != null &&
        amount != null &&
        amount > 0 &&
        !_isSaving;
  }

  DateTime? get _minEndDate {
    if (_startDate == null || _selectedFrequency == null) return _startDate;

    return switch (_selectedFrequency!) {
      Frequency.daily => _startDate!.add(const Duration(days: 1)),
      Frequency.weekly => _startDate!.add(const Duration(days: 7)),
      Frequency.monthly => DateTime(
        _startDate!.year,
        _startDate!.month + 1,
        _startDate!.day.clamp(1, DateTime(_startDate!.year, _startDate!.month + 2, 0).day),
      ),
      Frequency.yearly => DateTime(
        _startDate!.year + 1,
        _startDate!.month,
        _startDate!.day.clamp(1, DateTime(_startDate!.year + 1, _startDate!.month + 1, 0).day),
      ),
    };
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

  Future<void> _saveRecurring() async {
    final amount = _formatter.tryParse(_amountController.text.trim());
    if (amount == null || _selectedCategory == null || _selectedFrequency == null || _startDate == null) return;

    setState(() => _isSaving = true);

    try {
      final recurring = RecurringModel(
        title: _titleController.text.trim(),
        amount: amount.toDouble(),
        category: _selectedCategory!,
        type: _selectedType,
        currency: 'TRY',
        frequency: _selectedFrequency!,
        startDate: DateTime(_startDate!.year, _startDate!.month, _startDate!.day),
        endDate: _endDate != null ? DateTime(_endDate!.year, _endDate!.month, _endDate!.day) : null,
      );

      await ref.read(recurringServiceProvider).createRecurring(recurring);

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
            TextField(
              controller: _titleController,
              onChanged: (_) => setState(() {}),
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
            TransactionTypeSelector(
              selectedType: _selectedType,
              onTypeSelected: (type) => setState(() => _selectedType = type),
            ),
            const SizedBox(height: 24),
            CategorySelector(
              selectedCategory: _selectedCategory,
              onCategorySelected: (category) {
                if (category != null && _selectedCategory != category) {
                  setState(() => _selectedCategory = category);
                }
              },
            ),
            const SizedBox(height: 24),
            FrequencySelector(
              selectedFrequency: _selectedFrequency,
              onFrequencySelected: (val) {
                setState(() {
                  _selectedFrequency = val;
                  _endDate = null;
                });
              },
            ),
            const SizedBox(height: 24),
            DatePickerField(
              label: AppStrings.recurringStartDate.tr(),
              selectedDate: _startDate,
              firstDate: DateTime.now(),
              hintText: AppStrings.recurringPickStartDate.tr(),
              onDateSelected: (picked) {
                setState(() {
                  _startDate = picked;
                  _endDate = null;
                });
              },
            ),
            const SizedBox(height: 24),
            DatePickerField(
              label: AppStrings.recurringEndDateOptional.tr(),
              selectedDate: _endDate,
              firstDate: _minEndDate ?? DateTime.now(),
              hintText: AppStrings.recurringPickEndDate.tr(),
              isClearable: true,
              onDateSelected: (picked) => setState(() => _endDate = picked),
            ),
            const SizedBox(height: 24),
            SaveTransactionButton(
              label: AppStrings.transactionsSave.tr(),
              isLoading: _isSaving,
              icon: Icons.check_circle_outline,
              onPressed: _isFormValid ? _saveRecurring : null,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
