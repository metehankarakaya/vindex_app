import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_type.dart';

part 'transaction_filter.freezed.dart';

@freezed
abstract class TransactionFilter with _$TransactionFilter {
  const factory TransactionFilter({
    TransactionCategory? category,
    TransactionType? type,
    DateTime? startDate,
    DateTime? endDate,
    double? minAmount,
    double? maxAmount,
    String? keyword,
  }) = _TransactionFilter;

  const TransactionFilter._();

  bool get isEmpty =>
      category == null &&
      type == null &&
      startDate == null &&
      endDate == null &&
      minAmount == null &&
      maxAmount == null &&
      (keyword == null || keyword!.isEmpty);
}
