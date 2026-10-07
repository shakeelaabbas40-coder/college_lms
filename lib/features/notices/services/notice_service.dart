import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/notice_model.dart';

class NoticeService {
  // Fetch college notices from Laravel
  static Future<List<NoticeModel>> getNotices() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.notices);
      final List list = response is List ? response : (response['data'] ?? []);
      return list.map((item) => NoticeModel.fromJson(item)).toList();
    } catch (_) {
      return [
        NoticeModel(
          id: 1,
          title: 'Midterm Examination Schedule Released',
          description: 'The tentative schedule for Midterm Examinations Fall 2026 has been uploaded to the student portal.',
          publishedAt: '2026-10-06',
        ),
        NoticeModel(
          id: 2,
          title: 'Annual Sports Gala Registration',
          description: 'Students interested in participating in the annual inter-departmental sports tournament can submit registrations before Oct 20.',
          publishedAt: '2026-10-04',
        ),
      ];
    }
  }
}
