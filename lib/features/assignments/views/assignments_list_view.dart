import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../models/assignment_model.dart';
import '../services/assignment_service.dart';

class AssignmentsListView extends StatefulWidget {
  const AssignmentsListView({super.key});

  @override
  State<AssignmentsListView> createState() => _AssignmentsListViewState();
}

class _AssignmentsListViewState extends State<AssignmentsListView> {
  List<AssignmentModel> _assignments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAssignments();
  }

  Future<void> _loadAssignments() async {
    final list = await AssignmentService.getAssignments();
    if (mounted) {
      setState(() {
        _assignments = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _assignments.length,
              itemBuilder: (context, index) {
                final item = _assignments[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${item.courseName} • Due: ${item.dueDate}'),
                    trailing: Chip(
                      label: Text(
                        item.isSubmitted ? 'Submitted' : 'Pending',
                        style: TextStyle(
                          color: item.isSubmitted ? Colors.green.shade800 : Colors.orange.shade800,
                          fontSize: 11,
                        ),
                      ),
                      backgroundColor: item.isSubmitted ? Colors.green.shade50 : Colors.orange.shade50,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.assignmentDetails, arguments: item);
                    },
                  ),
                );
              },
            ),
    );
  }
}
