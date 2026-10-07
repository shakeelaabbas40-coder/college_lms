import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../models/profile_model.dart';

class ProfileService {
  // Fetch user profile from Laravel /api/user
  static Future<ProfileModel> getProfile() async {
    try {
      final response = await ApiClient.get(ApiEndpoints.userProfile);
      return ProfileModel.fromJson(response);
    } catch (_) {
      return ProfileModel(
        id: 1,
        name: 'Ali Raza',
        email: 'ali.raza@college.edu.pk',
        phone: '+92 312 9876543',
        department: 'Computer Science',
        studentId: 'BSCS-2023-042',
      );
    }
  }
}
