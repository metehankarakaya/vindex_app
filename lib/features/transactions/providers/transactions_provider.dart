import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vindex_app/features/transactions/models/transaction_filter.dart';
import 'package:vindex_app/features/transactions/models/transactions_state.dart';
import 'package:vindex_app/features/transactions/services/transaction_service.dart';

import '../../../core/models/transaction_model.dart';
import '../../dashboard/providers/dashboard_summary_provider.dart';

part 'transactions_provider.g.dart';

@Riverpod(keepAlive: true)
class Transactions extends _$Transactions {
  static const int _pageSize = 20;

  @override
  TransactionsState build() {
    return const TransactionsState(isInitialLoading: true);
  }

  Future<void> loadFirstPage() async {
    state = state.copyWith(isInitialLoading: true, errorMessage: null);

    try {
      final service = ref.read(transactionServiceProvider);
      final result = await service.getTransactions(
        page: 0,
        size: _pageSize,
        category: state.filter.category,
        type: state.filter.type,
        startDate: state.filter.startDate,
        endDate: state.filter.endDate,
        minAmount: state.filter.minAmount,
        maxAmount: state.filter.maxAmount,
        keyword: state.filter.keyword,
      );

      state = state.copyWith(
        items: result.content,
        currentPage: result.number,
        totalPages: result.totalPages,
        isInitialLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isInitialLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> loadNextPage() async {
    if (state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final service = ref.read(transactionServiceProvider);
      final result = await service.getTransactions(
        page: state.currentPage + 1,
        size: _pageSize,
        category: state.filter.category,
        type: state.filter.type,
        startDate: state.filter.startDate,
        endDate: state.filter.endDate,
        minAmount: state.filter.minAmount,
        maxAmount: state.filter.maxAmount,
        keyword: state.filter.keyword,
      );

      state = state.copyWith(
        items: [...state.items, ...result.content],
        currentPage: result.number,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, errorMessage: e.toString());
    }
  }

  Future<void> deleteTransaction(String id) async {
    final service = ref.read(transactionServiceProvider);
    await service.deleteTransaction(id);
    state = state.copyWith(items: state.items.where((t) => t.id != id).toList());
  }

  void applyFilter(TransactionFilter filter) {
    state = state.copyWith(filter: filter);
    loadFirstPage();
  }

  void clearFilter() {
    state = state.copyWith(filter: const TransactionFilter());
    loadFirstPage();
  }

  Future<void> createTransaction(TransactionModel transaction) async {
    final service = ref.read(transactionServiceProvider);
    await service.createTransaction(transaction);
    await loadFirstPage();
    ref.invalidate(dashboardSummaryProvider);
  }

  Future<void> deleteAllTransactions() async {
    final service = ref.read(transactionServiceProvider);
    await service.deleteAllTransactions();
    state = state.copyWith(items: [], currentPage: 0, totalPages: 0);
    ref.invalidate(dashboardSummaryProvider);
  }

}
