import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../../../core/services/storage_service.dart';
import '../models/user_model.dart';

class AuthService {
  // Login with Laravel Sanctum
  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(ApiEndpoints.login, {
      'email': email,
      'password': password,
    });

    // Laravel standard response: { 'token': '...', 'user': { ... } }
    final token = (response is Map) ? response['token'] : null;
    final userData = (response is Map) ? response['user'] : null;
    final user = (userData is Map<String, dynamic>)
        ? UserModel.fromJson(userData)
        : UserModel(name: email.split('@').first, email: email, role: 'student');

    if (token != null) {
      await StorageService.saveToken(token.toString());
    }
    if (user.role != null) {
      await StorageService.saveRole(user.role!);
    }

    return user;
  }

  // Logout
  static Future<void> logout() async {
    try {
      await ApiClient.post(ApiEndpoints.logout, {});
    } catch (_) {
      // Ignore API errors on logout to ensure local storage gets cleared
    } finally {
      await StorageService.clearAll();
    }
  }

  // Get current user profile
  static Future<UserModel> getProfile() async {
    final response = await ApiClient.get(ApiEndpoints.userProfile);
    return UserModel.fromJson(response);
  }
}
