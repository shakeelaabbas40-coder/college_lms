import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/attendance_model.dart';

class AttendanceService {
  // Fetch attendance from Laravel
  static Future<List<AttendanceModel>> getAttendance() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.attendance);
      final List list = response is List ? response : (response['data'] ?? []);
      return list.map((item) => AttendanceModel.fromJson(item)).toList();
    } catch (_) {
      return [
        AttendanceModel(id: 1, courseName: 'Data Structures', date: '2026-10-06', status: 'Present'),
        AttendanceModel(id: 2, courseName: 'Database Systems', date: '2026-10-05', status: 'Present'),
        AttendanceModel(id: 3, courseName: 'Software Engineering', date: '2026-10-04', status: 'Absent'),
        AttendanceModel(id: 4, courseName: 'Data Structures', date: '2026-10-03', status: 'Present'),
      ];
    }
  }
}
