import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vindex_app/core/constants/app_strings.dart';

import '../providers/transactions_provider.dart';
import '../widgets/transaction_filter_sheet.dart';
import '../widgets/transactions_empty_state.dart';
import '../widgets/transactions_sliver_list.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.microtask(() => ref.read(transactionsProvider.notifier).loadFirstPage());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final showBackToTop = _scrollController.offset > 300;
    if (showBackToTop != _showBackToTop) {
      setState(() => _showBackToTop = showBackToTop);
    }

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(transactionsProvider.notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(transactionsProvider.notifier).loadFirstPage(),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 100.0,
              pinned: true,
              stretch: true,
              backgroundColor: theme.scaffoldBackgroundColor,
              surfaceTintColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(AppStrings.navTransactions.tr(), style: theme.textTheme.titleMedium),
                titlePadding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
                centerTitle: false,
              ),
              actions: [
                IconButton(
                  icon: Badge(
                    isLabelVisible: !state.filter.isEmpty,
                    child: const Icon(Icons.filter_list),
                  ),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.85,
                    ),
                    builder: (_) => const TransactionFilterSheet(),
                  ),
                ),
              ],
            ),
            if (state.isInitialLoading)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator.adaptive()),
              )
            else if (state.errorMessage != null && state.items.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(AppStrings.commonErrorPrefix.tr(namedArgs: {'message': state.errorMessage!})),
                ),
              )
            else if (state.items.isEmpty)
              const TransactionsEmptyState()
            else
              TransactionsSliverList(state: state),
          ],
        ),
      ),
      floatingActionButton: _showBackToTop
      ? FloatingActionButton(
        onPressed: () => _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        child: const Icon(Icons.arrow_upward_outlined),
      )
      : null,
    );
  }
}
