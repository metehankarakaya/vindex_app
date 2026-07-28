import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vindex_app/features/dashboard/models/dashboard_summary_model.dart';
import 'package:vindex_app/features/dashboard/services/dashboard_service.dart';

part 'dashboard_summary_provider.g.dart';

@riverpod
Future<DashboardSummaryModel> dashboardSummary(Ref ref) async {
  final service = ref.watch(dashboardServiceProvider);
  return service.getSummary();
}
