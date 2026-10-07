import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../auth/services/auth_service.dart';
import '../models/dashboard_summary_model.dart';
import '../services/dashboard_service.dart';

class StudentDashboardView extends StatefulWidget {
  const StudentDashboardView({super.key});

  @override
  State<StudentDashboardView> createState() => _StudentDashboardViewState();
}

class _StudentDashboardViewState extends State<StudentDashboardView> {
  DashboardSummaryModel _summary = DashboardSummaryModel();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSummary();
  }

  Future<void> _loadSummary() async {
    final data = await DashboardService.getDashboardSummary();
    if (mounted) {
      setState(() {
        _summary = data;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Portal'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logout();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              }
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadSummary,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Summary Banner
                  Card(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Academic Overview',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildMetric('Courses', '${_summary.totalCourses}'),
                              _buildMetric('Attendance', '${_summary.attendancePercentage}%'),
                              _buildMetric('Pending Tasks', '${_summary.pendingAssignments}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Quick Access', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  // Grid Menu
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      _buildMenuItem(Icons.book, 'Courses', () => Navigator.pushNamed(context, AppRoutes.courses)),
                      _buildMenuItem(Icons.check_circle_outline, 'Attendance', () => Navigator.pushNamed(context, AppRoutes.attendance)),
                      _buildMenuItem(Icons.assignment, 'Assignments', () => Navigator.pushNamed(context, AppRoutes.assignments)),
                      _buildMenuItem(Icons.schedule, 'Timetable', () => Navigator.pushNamed(context, AppRoutes.timetable)),
                      _buildMenuItem(Icons.grade, 'Results', () => Navigator.pushNamed(context, AppRoutes.results)),
                      _buildMenuItem(Icons.payment, 'Fees', () => Navigator.pushNamed(context, AppRoutes.fees)),
                      _buildMenuItem(Icons.notifications, 'Notices', () => Navigator.pushNamed(context, AppRoutes.notices)),
                      _buildMenuItem(Icons.event_note, 'Exams', () => Navigator.pushNamed(context, AppRoutes.exams)),
                      _buildMenuItem(Icons.person, 'Profile', () => Navigator.pushNamed(context, AppRoutes.profile)),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
