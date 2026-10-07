import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/result_model.dart';
import '../services/exam_service.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({super.key});

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  List<ResultModel> _results = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    final list = await ExamService.getResults();
    if (mounted) {
      setState(() {
        _results = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examination Results'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final item = _results[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      child: Text(item.grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    title: Text(item.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Score: ${item.obtainedMarks} / ${item.totalMarks}'),
                    trailing: Text(
                      '${item.totalMarks > 0 ? ((item.obtainedMarks / item.totalMarks) * 100).toStringAsFixed(1) : "0.0"}%',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
