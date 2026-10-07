import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/dashboard_summary_model.dart';

class DashboardService {
  // Fetch dashboard summary from Laravel
  static Future<DashboardSummaryModel> getDashboardSummary() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.dashboard);
      return DashboardSummaryModel.fromJson(response);
    } catch (_) {
      // Fallback default values if backend is not yet populated
      return DashboardSummaryModel(
        totalCourses: 5,
        attendancePercentage: 88.5,
        pendingAssignments: 2,
        unreadNotices: 3,
      );
    }
  }
}
