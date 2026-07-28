import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/transaction_type.dart';
import '../../../core/widgets/empty_holder.dart';
import '../providers/dashboard_summary_provider.dart';
import '../widgets/balance_card.dart';
import '../widgets/total_balance_title.dart';
import '../widgets/transaction_summary_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final summaryAsync = ref.watch(dashboardSummaryProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(dashboardSummaryProvider.future),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120.0,
              pinned: true,
              stretch: true,
              backgroundColor: theme.scaffoldBackgroundColor,
              surfaceTintColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                stretchModes: const [StretchMode.zoomBackground],
                titlePadding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
                title: Text(
                  "Vindex",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 2.0),
                    child: TotalBalanceTitle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 2.0, 0.0, 8.0),
                    child: BalanceCard(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 4.0, 16.0),
                          child: TransactionSummaryCard(type: TransactionType.income),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4.0, 8.0, 16.0, 16.0),
                          child: TransactionSummaryCard(type: TransactionType.expense),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: Text(
                    "Recent Transactions",
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            summaryAsync.when(
              data: (summary) {
                if (summary.recentTransactions.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyHolder(
                      iconData: Icons.receipt_long_outlined,
                      title: "No Transactions Yet",
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverList.separated(
                    itemCount: summary.recentTransactions.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final transaction = summary.recentTransactions[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(transaction.title),
                        subtitle: Text(transaction.category.name),
                        trailing: Text('${transaction.amount.toStringAsFixed(2)} ₺'),
                      );
                    },
                  ),
                );
              },
              loading: () => SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator.adaptive(),),
              ),
              error: (error, stackTree) => SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text("Error: $error"),),
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
