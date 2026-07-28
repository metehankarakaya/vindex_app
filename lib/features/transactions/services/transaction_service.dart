import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/transaction_model.dart';
import '../../../core/network/paged_response.dart';
import '../../../core/providers/dio_provider.dart';

class TransactionService {
  final Dio _dio;
  TransactionService(this._dio);

  Future<PagedResponse<TransactionModel>> getTransactions({
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      '/transactions',
      queryParameters: {'page': page, 'size': size},
    );

    return PagedResponse.fromJson(
      response.data as Map<String, dynamic>,
          (json) => TransactionModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<TransactionModel> createTransaction(TransactionModel transaction) async {
    final response = await _dio.post(
      '/transactions',
      data: transaction.toJson(),
    );

    return TransactionModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteTransaction(String id) async {
    await _dio.delete('/transactions/$id');
  }

}

@riverpod
TransactionService transactionService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TransactionService(dio);
}
