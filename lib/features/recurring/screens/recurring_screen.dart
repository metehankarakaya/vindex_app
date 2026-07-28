import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../providers/recurrings_provider.dart';
import '../widgets/recurring_cancel_dialog.dart';
import '../widgets/recurring_list_item.dart';
import '../widgets/recurrings_empty_state.dart';

class RecurringScreen extends ConsumerWidget {
  const RecurringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recurringsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(recurringsProvider.notifier).loadAll(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 100.0,
              pinned: true,
              stretch: true,
              backgroundColor: theme.scaffoldBackgroundColor,
              surfaceTintColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(AppStrings.navRecurring.tr(), style: theme.textTheme.titleMedium),
                titlePadding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
                centerTitle: false,
              ),
            ),
            if (state.isLoading)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator.adaptive()),
              )
            else if (state.errorMessage != null && state.items.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text('Error: ${state.errorMessage}')),
              )
            else if (state.items.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: RecurringsEmptyState(),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverList.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final recurring = state.items[index];
                      return RecurringListItem(
                        recurring: recurring,
                        onLongPress: () async {
                          final confirmed = await RecurringCancelDialog.show(context, recurring.title);
                          if (confirmed) {
                            await ref.read(recurringsProvider.notifier).deleteRecurring(recurring.id!);
                          }
                        },
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
