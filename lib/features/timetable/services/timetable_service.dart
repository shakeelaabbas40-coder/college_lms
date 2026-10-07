import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/timetable_model.dart';

class TimetableService {
  // Fetch weekly timetable from Laravel
  static Future<List<TimetableModel>> getTimetable() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.timetable);
      final List list = response is List ? response : (response['data'] ?? []);
      return list.map((item) => TimetableModel.fromJson(item)).toList();
    } catch (_) {
      return [
        TimetableModel(id: 1, day: 'Monday', subject: 'Data Structures', time: '08:30 AM - 10:00 AM', roomNo: 'Room 101'),
        TimetableModel(id: 2, day: 'Monday', subject: 'Database Systems', time: '10:15 AM - 11:45 AM', roomNo: 'Lab 1'),
        TimetableModel(id: 3, day: 'Tuesday', subject: 'Software Engineering', time: '09:00 AM - 10:30 AM', roomNo: 'Room 204'),
        TimetableModel(id: 4, day: 'Wednesday', subject: 'Data Structures Lab', time: '11:00 AM - 01:00 PM', roomNo: 'Lab 3'),
      ];
    }
  }
}
