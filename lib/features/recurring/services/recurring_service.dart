import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/recurring_model.dart';
import '../../../core/providers/dio_provider.dart';

class RecurringService {
  final Dio _dio;
  RecurringService(this._dio);

  Future<List<RecurringModel>> getRecurrings() async {
    final response = await _dio.get('/recurrings');

    return (response.data as List)
        .map((json) => RecurringModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<RecurringModel> createRecurring(RecurringModel recurring) async {
    final response = await _dio.post(
      '/recurrings',
      data: recurring.toJson(),
    );

    return RecurringModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteRecurring(String id) async {
    await _dio.delete('/recurrings/$id');
  }

}

@riverpod
RecurringService recurringService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return RecurringService(dio);
}
