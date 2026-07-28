import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vindex_app/core/models/transaction_model.dart';

part 'dashboard_summary_model.freezed.dart';
part 'dashboard_summary_model.g.dart';

@freezed
abstract class DashboardSummaryModel with _$DashboardSummaryModel {
  const factory DashboardSummaryModel({
    required double totalIncome,
    required double totalExpense,
    required double balance,
    required List<TransactionModel> recentTransactions,
  }) = _DashboardSummaryModel;

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) => _$DashboardSummaryModelFromJson(json);
}
