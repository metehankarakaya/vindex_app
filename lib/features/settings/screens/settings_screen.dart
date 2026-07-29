import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/constants/app_strings.dart';
import 'package:vindex_app/features/settings/widgets/language_selector.dart';
import 'package:vindex_app/features/settings/widgets/theme_selector.dart';

import '../providers/theme_mode_provider.dart';
import '../widgets/settings_list_item.dart';
import '../widgets/sliver_section_header.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeControllerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final themeSubtitle = switch (themeMode) {
      ThemeMode.light => AppStrings.settingsThemeLight.tr(),
      ThemeMode.dark => AppStrings.settingsThemeDark.tr(),
      ThemeMode.system => AppStrings.settingsThemeSystem.tr(),
    };

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100.0,
            pinned: true,
            stretch: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(AppStrings.navSettings.tr(), style: theme.textTheme.titleMedium),
              titlePadding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
              centerTitle: false,
            ),
          ),
          SliverSectionHeader(title: AppStrings.settingsAppearance.tr().toUpperCase()),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                color: colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    SettingsListItem(
                      leadingIcon: Icons.palette_outlined,
                      title: AppStrings.settingsTheme.tr(),
                      subtitle: themeSubtitle,
                      onTap: () => ThemeSelector.show(context),
                      showDivider: true,
                    ),
                    SettingsListItem(
                      leadingIcon: Icons.language,
                      title: AppStrings.settingsLanguage.tr(),
                      subtitle: context.locale.languageCode == 'tr' ? 'Türkçe' : 'English',
                      onTap: () => LanguageSelector.show(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
