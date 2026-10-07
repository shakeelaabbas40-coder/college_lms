class ApiEndpoints {
  // Laravel Backend Base URL
  static const String baseUrl = 'http://10.0.2.2:8000/api'; // Android Emulator localhost (change for physical device/production)

  // Auth Endpoints (Laravel Sanctum)
  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';
  static const String userProfile = '/user';
  static const String forgotPassword = '/forgot-password';

  // Academic & LMS Endpoints
  static const String dashboard = '/dashboard';
  static const String courses = '/courses';
  static const String attendance = '/attendance';
  static const String assignments = '/assignments';
  static const String submitAssignment = '/assignments/submit';
  static const String exams = '/exams';
  static const String results = '/results';
  static const String timetable = '/timetable';
  static const String notices = '/notices';
  static const String fees = '/fees';
}
