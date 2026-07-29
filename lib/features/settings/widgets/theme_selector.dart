import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/constants/app_strings.dart';

import '../providers/theme_mode_provider.dart';

class ThemeSelector {
  ThemeSelector._();

  static void show(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) => Consumer(
        builder: (context, ref, _) {
          final themeMode = ref.watch(themeModeControllerProvider);

          Widget buildOption(ThemeMode mode, IconData icon, String label) {
            final isSelected = themeMode == mode;
            return ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              leading: Icon(icon, color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant),
              title: Text(
                label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                ),
              ),
              trailing: isSelected ? Icon(Icons.check_circle, color: colorScheme.primary) : null,
              onTap: () {
                ref.read(themeModeControllerProvider.notifier).setThemeMode(mode);
                Navigator.pop(context);
              },
            );
          }

          return SafeArea(
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
                  buildOption(ThemeMode.system, Icons.brightness_auto_outlined, AppStrings.settingsThemeSystem.tr()),
                  buildOption(ThemeMode.light, Icons.light_mode_outlined, AppStrings.settingsThemeLight.tr()),
                  buildOption(ThemeMode.dark, Icons.dark_mode_outlined, AppStrings.settingsThemeDark.tr()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
