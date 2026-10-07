import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/course_model.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final course = ModalRoute.of(context)?.settings.arguments as CourseModel?;

    return Scaffold(
      appBar: AppBar(
        title: Text(course?.code ?? 'Course Details'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course?.name ?? 'Course Title',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                  const SizedBox(height: 8),
                  Text('Instructor: ${course?.teacherName ?? "Faculty"}'),
                  Text('Credit Hours: ${course?.creditHours ?? 3} Credit Hours'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Course Materials & Syllabus', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
            title: const Text('Course Outline & Policy'),
            subtitle: const Text('PDF • 1.2 MB'),
            trailing: const Icon(Icons.download),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.slideshow, color: Colors.orange),
            title: const Text('Lecture 1 - Introduction Slides'),
            subtitle: const Text('PPTX • 4.5 MB'),
            trailing: const Icon(Icons.download),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
