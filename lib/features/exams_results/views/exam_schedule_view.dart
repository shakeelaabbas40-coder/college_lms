import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ExamScheduleView extends StatelessWidget {
  const ExamScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {'date': '2026-11-01', 'subject': 'Data Structures', 'time': '09:00 AM - 12:00 PM', 'room': 'Hall A'},
      {'date': '2026-11-03', 'subject': 'Database Systems', 'time': '09:00 AM - 12:00 PM', 'room': 'Hall B'},
      {'date': '2026-11-05', 'subject': 'Software Engineering', 'time': '02:00 PM - 05:00 PM', 'room': 'Lab 2'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Date Sheet'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final exam = schedule[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.event, color: AppColors.primary),
              title: Text(exam['subject']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${exam['date']} • ${exam['time']}'),
              trailing: Chip(label: Text(exam['room']!)),
            ),
          );
        },
      ),
    );
  }
}
