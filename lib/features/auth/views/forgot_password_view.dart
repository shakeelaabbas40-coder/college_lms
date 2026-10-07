import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  void _handleReset() {
    if (_emailController.text.trim().isEmpty) {
      Helpers.showErrorSnackbar(context, 'Please enter your registered email');
      return;
    }
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isLoading = false);
        Helpers.showSuccessSnackbar(context, 'Password reset link sent to your email');
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your email to receive a password reset link from the college administration.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              label: 'College Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Send Reset Link',
              isLoading: _isLoading,
              onPressed: _handleReset,
            ),
          ],
        ),
      ),
    );
  }
}
