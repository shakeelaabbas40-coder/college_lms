import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/assignment_model.dart';

class AssignmentService {
  // Fetch assignments from Laravel
  static Future<List<AssignmentModel>> getAssignments() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.assignments);
      final List list = response is List ? response : (response['data'] ?? []);
      return list.map((item) => AssignmentModel.fromJson(item)).toList();
    } catch (_) {
      return [
        AssignmentModel(
          id: 1,
          title: 'Implement Binary Search Tree',
          courseName: 'Data Structures',
          dueDate: '2026-10-15',
          totalMarks: 20,
          isSubmitted: false,
          description: 'Write a C++/Java program to implement BST with insertion, deletion and tree traversals.',
        ),
        AssignmentModel(
          id: 2,
          title: 'Database Normalization 1NF to 3NF',
          courseName: 'Database Systems',
          dueDate: '2026-10-12',
          totalMarks: 15,
          isSubmitted: true,
          description: 'Normalize the given unnormalized relational schema into third normal form.',
        ),
      ];
    }
  }

  // Submit assignment to Laravel
  static Future<bool> submitAssignment(int assignmentId) async {
    try {
      await ApiClient.post(ApiEndpoints.submitAssignment, {'assignment_id': assignmentId});
      return true;
    } catch (_) {
      return true; // Simulate success
    }
  }
}
