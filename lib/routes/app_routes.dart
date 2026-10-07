import 'package:flutter/material.dart';
import '../features/assignments/views/assignment_details_view.dart';
import '../features/assignments/views/assignments_list_view.dart';
import '../features/attendance/views/attendance_view.dart';
import '../features/auth/views/forgot_password_view.dart';
import '../features/auth/views/login_view.dart';
import '../features/courses/views/course_details_view.dart';
import '../features/courses/views/courses_list_view.dart';
import '../features/dashboard/views/student_dashboard_view.dart';
import '../features/dashboard/views/teacher_dashboard_view.dart';
import '../features/exams_results/views/exam_schedule_view.dart';
import '../features/exams_results/views/results_view.dart';
import '../features/fees/views/fees_view.dart';
import '../features/notices/views/notices_view.dart';
import '../features/profile/views/profile_view.dart';
import '../features/timetable/views/timetable_view.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String studentDashboard = '/student-dashboard';
  static const String teacherDashboard = '/teacher-dashboard';
  static const String courses = '/courses';
  static const String courseDetails = '/course-details';
  static const String attendance = '/attendance';
  static const String assignments = '/assignments';
  static const String assignmentDetails = '/assignment-details';
  static const String exams = '/exams';
  static const String results = '/results';
  static const String timetable = '/timetable';
  static const String fees = '/fees';
  static const String notices = '/notices';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
        login: (context) => const LoginView(),
        forgotPassword: (context) => const ForgotPasswordView(),
        studentDashboard: (context) => const StudentDashboardView(),
        teacherDashboard: (context) => const TeacherDashboardView(),
        courses: (context) => const CoursesListView(),
        courseDetails: (context) => const CourseDetailsView(),
        attendance: (context) => const AttendanceView(),
        assignments: (context) => const AssignmentsListView(),
        assignmentDetails: (context) => const AssignmentDetailsView(),
        exams: (context) => const ExamScheduleView(),
        results: (context) => const ResultsView(),
        timetable: (context) => const TimetableView(),
        fees: (context) => const FeesView(),
        notices: (context) => const NoticesView(),
        profile: (context) => const ProfileView(),
      };
}
