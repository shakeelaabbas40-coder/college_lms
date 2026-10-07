import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/widgets/custom_button.dart';
import '../models/assignment_model.dart';
import '../services/assignment_service.dart';

class AssignmentDetailsView extends StatefulWidget {
  const AssignmentDetailsView({super.key});

  @override
  State<AssignmentDetailsView> createState() => _AssignmentDetailsViewState();
}

class _AssignmentDetailsViewState extends State<AssignmentDetailsView> {
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final assignment = ModalRoute.of(context)?.settings.arguments as AssignmentModel?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Details'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: assignment == null
          ? const Center(child: Text('No assignment data'))
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(assignment.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text('${assignment.courseName} • Total Marks: ${assignment.totalMarks}'),
                            Text('Deadline: ${assignment.dueDate}', style: const TextStyle(color: Colors.red)),
                            const Divider(height: 24),
                            const Text('Instructions:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 8),
                            Text(assignment.description, style: const TextStyle(color: AppColors.textSecondary, height: 1.4)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: assignment.isSubmitted ? 'Resubmit Assignment' : 'Upload & Submit File',
                      isLoading: _isSubmitting,
                      onPressed: () async {
                        setState(() => _isSubmitting = true);
                        await AssignmentService.submitAssignment(assignment.id);
                        if (context.mounted) {
                          setState(() => _isSubmitting = false);
                          Helpers.showSuccessSnackbar(context, 'Assignment submitted successfully!');
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
