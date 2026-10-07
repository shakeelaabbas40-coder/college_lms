import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/course_model.dart';

class CourseService {
  // Fetch courses from Laravel
  static Future<List<CourseModel>> getCourses() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.courses);
      final List list = response is List ? response : (response['data'] ?? []);
      return list.map((item) => CourseModel.fromJson(item)).toList();
    } catch (_) {
      // Mock data when API not yet connected
      return [
        CourseModel(id: 1, code: 'CS-301', name: 'Data Structures & Algorithms', teacherName: 'Dr. Ahmad', creditHours: 4),
        CourseModel(id: 2, code: 'CS-305', name: 'Database Management Systems', teacherName: 'Prof. Sana', creditHours: 3),
        CourseModel(id: 3, code: 'SE-202', name: 'Software Engineering', teacherName: 'Engr. Bilal', creditHours: 3),
      ];
    }
  }
}
