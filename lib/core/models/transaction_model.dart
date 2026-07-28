import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_type.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {

  const factory TransactionModel({
    String? id,
    required String title,
    required double amount,
    required TransactionCategory category,
    required TransactionType type,
    required String currency,
    required DateTime transactionDate,
    String? recurringId,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

}
