import 'package:flutter/material.dart';
import 'package:vindex_app/core/models/frequency.dart';
import 'package:vindex_app/core/utils/frequency_utils.dart';

class FrequencySelector extends StatelessWidget {
  final Frequency? selectedFrequency;
  final ValueChanged<Frequency?> onFrequencySelected;

  const FrequencySelector({
    super.key,
    required this.selectedFrequency,
    required this.onFrequencySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final frequencies = Frequency.values;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 2.1,
      ),
      itemCount: frequencies.length,
      itemBuilder: (context, index) {
        final frequency = frequencies[index];
        final isSelected = selectedFrequency == frequency;

        return GestureDetector(
          onTap: () => onFrequencySelected(frequency),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                ? null
                : Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.2)),
            ),
            child: Center(
              child: Text(
                labelForFrequency(frequency),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
