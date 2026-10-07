import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../auth/services/auth_service.dart';

class TeacherDashboardView extends StatelessWidget {
  const TeacherDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Portal'),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Faculty Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.fact_check, color: AppColors.primary),
            title: const Text('Mark Attendance'),
            subtitle: const Text('Submit today\'s student attendance'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.attendance),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.rate_review, color: AppColors.primary),
            title: const Text('Grade Assignments'),
            subtitle: const Text('Review and evaluate student submissions'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.assignments),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.book, color: AppColors.primary),
            title: const Text('My Classes & Lectures'),
            subtitle: const Text('View assigned courses and uploaded syllabus'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.courses),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.campaign, color: AppColors.primary),
            title: const Text('Announce Notice'),
            subtitle: const Text('Publish department or course announcement'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.notices),
          ),
        ],
      ),
    );
  }
}
