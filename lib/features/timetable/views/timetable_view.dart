import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/timetable_model.dart';
import '../services/timetable_service.dart';

class TimetableView extends StatefulWidget {
  const TimetableView({super.key});

  @override
  State<TimetableView> createState() => _TimetableViewState();
}

class _TimetableViewState extends State<TimetableView> {
  List<TimetableModel> _schedule = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSchedule();
  }

  Future<void> _loadSchedule() async {
    final list = await TimetableService.getTimetable();
    if (mounted) {
      setState(() {
        _schedule = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Timetable'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _schedule.length,
              itemBuilder: (context, index) {
                final item = _schedule[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondary.withValues(alpha: 0.15),
                      child: Text(
                        item.day.length >= 3 ? item.day.substring(0, 3) : item.day,
                        style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(item.subject, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${item.time} • ${item.roomNo}'),
                    trailing: const Icon(Icons.schedule, color: Colors.grey),
                  ),
                );
              },
            ),
    );
  }
}
