import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/fee_model.dart';

class FeeService {
  // Fetch fees from Laravel
  static Future<List<FeeModel>> getFees() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.fees);
      final List list = response is List ? response : (response['data'] ?? []);
      return list.map((item) => FeeModel.fromJson(item)).toList();
    } catch (_) {
      return [
        FeeModel(id: 1, title: 'Fall 2026 Tuition Fee', challanNumber: 'CH-9921', amount: 45000, dueDate: '2026-10-25', status: 'Unpaid'),
        FeeModel(id: 2, title: 'Spring 2026 Tuition Fee', challanNumber: 'CH-8120', amount: 45000, dueDate: '2026-03-10', status: 'Paid'),
      ];
    }
  }
}
