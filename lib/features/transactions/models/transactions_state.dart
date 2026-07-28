import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vindex_app/core/models/transaction_model.dart';
import 'package:vindex_app/features/transactions/models/transaction_filter.dart';

part 'transactions_state.freezed.dart';

@freezed
abstract class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default([]) List<TransactionModel> items,
    @Default(0) int currentPage,
    @Default(0) int totalPages,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isInitialLoading,
    @Default(TransactionFilter()) TransactionFilter filter,
    String? errorMessage,
  }) = _TransactionsState;

  const TransactionsState._();

  bool get hasMore => currentPage < totalPages - 1;
}
