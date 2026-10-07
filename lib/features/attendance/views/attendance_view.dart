import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/attendance_model.dart';
import '../services/attendance_service.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  List<AttendanceModel> _records = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAttendance();
  }

  Future<void> _loadAttendance() async {
    final list = await AttendanceService.getAttendance();
    if (mounted) {
      setState(() {
        _records = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Attendance'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _records.length,
              itemBuilder: (context, index) {
                final item = _records[index];
                final isPresent = item.status.toLowerCase() == 'present';
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: Icon(
                      isPresent ? Icons.check_circle : Icons.cancel,
                      color: isPresent ? Colors.green : Colors.red,
                    ),
                    title: Text(item.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Date: ${item.date}'),
                    trailing: Chip(
                      label: Text(
                        item.status,
                        style: TextStyle(color: isPresent ? Colors.green.shade800 : Colors.red.shade800),
                      ),
                      backgroundColor: isPresent ? Colors.green.shade50 : Colors.red.shade50,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
