import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vindex_app/core/models/frequency.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_type.dart';

part 'recurring_model.freezed.dart';
part 'recurring_model.g.dart';

@freezed
abstract class RecurringModel with _$RecurringModel {
  const factory RecurringModel({
    String? id,
    required String title,
    required double amount,
    required TransactionCategory category,
    required TransactionType type,
    required String currency,
    required Frequency frequency,
    required DateTime startDate,
    DateTime? endDate,
    DateTime? nextDueDate,
  }) = _RecurringModel;

  factory RecurringModel.fromJson(Map<String, dynamic> json) => _$RecurringModelFromJson(json);
}
