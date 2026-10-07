import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _tokenKey = 'auth_token';
  static const String _userRoleKey = 'user_role';

  // Save auth token from Laravel Sanctum
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Retrieve auth token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Save user role (student, teacher, admin)
  static Future<void> saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userRoleKey, role);
  }

  // Retrieve user role
  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRoleKey);
  }

  // Clear storage on logout
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
