import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../models/course_model.dart';
import '../services/course_service.dart';

class CoursesListView extends StatefulWidget {
  const CoursesListView({super.key});

  @override
  State<CoursesListView> createState() => _CoursesListViewState();
}

class _CoursesListViewState extends State<CoursesListView> {
  List<CourseModel> _courses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    final list = await CourseService.getCourses();
    if (mounted) {
      setState(() {
        _courses = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enrolled Courses'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                final course = _courses[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      child: Text(
                        course.code.split('-').first,
                        style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                    title: Text(course.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${course.code} • ${course.teacherName}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.courseDetails, arguments: course);
                    },
                  ),
                );
              },
            ),
    );
  }
}
