import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/result_model.dart';

class ExamService {
  // Fetch results from Laravel
  static Future<List<ResultModel>> getResults() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.results);
      final List list = response is List ? response : (response['data'] ?? []);
      return list.map((item) => ResultModel.fromJson(item)).toList();
    } catch (_) {
      return [
        ResultModel(id: 1, courseName: 'Data Structures', obtainedMarks: 85, totalMarks: 100, grade: 'A'),
        ResultModel(id: 2, courseName: 'Database Systems', obtainedMarks: 78, totalMarks: 100, grade: 'B+'),
        ResultModel(id: 3, courseName: 'Software Engineering', obtainedMarks: 91, totalMarks: 100, grade: 'A+'),
      ];
    }
  }
}
