import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vindex_app/core/providers/dio_provider.dart';
import 'package:vindex_app/features/dashboard/models/dashboard_summary_model.dart';

part 'dashboard_service.g.dart';

class DashboardService {
  final Dio _dio;

  DashboardService(this._dio);

  Future<DashboardSummaryModel> getSummary() async {
    final response = await _dio.get('/dashboard/summary');
    return DashboardSummaryModel.fromJson(response.data as Map<String, dynamic>);
  }
}

@riverpod
DashboardService dashboardService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return DashboardService(dio);
}
