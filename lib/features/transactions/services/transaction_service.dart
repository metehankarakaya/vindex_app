import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/models/transaction_model.dart';
import 'package:vindex_app/core/models/transaction_type.dart';
import 'package:vindex_app/core/network/paged_response.dart';
import 'package:vindex_app/core/providers/dio_provider.dart';

part 'transaction_service.g.dart';

class TransactionService {
  final Dio _dio;

  TransactionService(this._dio);

  Future<PagedResponse<TransactionModel>> getTransactions({
    int page = 0,
    int size = 20,
    TransactionCategory? category,
    TransactionType? type,
    DateTime? startDate,
    DateTime? endDate,
    double? minAmount,
    double? maxAmount,
    String? keyword,
    String? sort,
  }) async {
    final response = await _dio.get(
      '/transactions',
      queryParameters: {
        'page': page,
        'size': size,
        if (category != null) 'category': category.name.toUpperCase(),
        if (type != null) 'type': type.name.toUpperCase(),
        if (startDate != null) 'startDate': _formatDate(startDate),
        if (endDate != null) 'endDate': _formatDate(endDate),
        if (minAmount != null) 'minAmountCent': (minAmount * 100).round(),
        if (maxAmount != null) 'maxAmountCent': (maxAmount * 100).round(),
        if (keyword != null && keyword.isNotEmpty) 'keyword': keyword,
        if (sort != null) 'sort': sort,
      },
    );

    return PagedResponse.fromJson(
      response.data as Map<String, dynamic>,
          (json) => TransactionModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<TransactionModel> createTransaction(TransactionModel transaction) async {
    final response = await _dio.post('/transactions', data: transaction.toJson());
    return TransactionModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteTransaction(String id) async {
    await _dio.delete('/transactions/$id');
  }

  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }
}

@riverpod
TransactionService transactionService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TransactionService(dio);
}
