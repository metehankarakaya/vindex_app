import 'package:flutter/material.dart';
import 'package:vindex_app/core/utils/date_formatter.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final DateTime firstDate;
  final String hintText;
  final bool isClearable;
  final ValueChanged<DateTime?> onDateSelected;

  const DatePickerField({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.firstDate,
    required this.hintText,
    required this.onDateSelected,
    this.isClearable = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final locale = Localizations.localeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? firstDate,
              firstDate: firstDate,
              lastDate: DateTime(2100),
            );
            if (picked != null && picked != selectedDate) {
              onDateSelected(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_rounded, size: 20, color: colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedDate == null ? hintText : DateFormatter.formatFullDate(selectedDate!, locale),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: selectedDate == null ? colorScheme.onSurfaceVariant : colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (isClearable && selectedDate != null)
                  IconButton(
                    icon: Icon(Icons.close_rounded, size: 20, color: colorScheme.error),
                    onPressed: () => onDateSelected(null),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                if (!isClearable || selectedDate == null) ...[
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 14, color: colorScheme.onSurfaceVariant),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
