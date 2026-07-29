import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSelector {
  LanguageSelector._();

  static void show(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentLocale = context.locale;

    Widget buildOption(BuildContext context, Locale locale, String label) {
      final isSelected = currentLocale.languageCode == locale.languageCode;
      return ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? colorScheme.primary : colorScheme.onSurface,
          ),
        ),
        trailing: isSelected ? Icon(Icons.check_circle, color: colorScheme.primary) : null,
        onTap: () {
          context.setLocale(locale);
          Navigator.pop(context);
        },
      );
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              buildOption(sheetContext, const Locale('en'), 'English'),
              buildOption(sheetContext, const Locale('tr'), 'Türkçe'),
            ],
          ),
        ),
      ),
    );
  }
}
