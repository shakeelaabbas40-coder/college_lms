import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';
import '../services/auth_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Helpers.showErrorSnackbar(context, 'Please enter email and password');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = await AuthService.login(email: email, password: password);
      if (!mounted) return;

      Helpers.showSuccessSnackbar(context, 'Welcome ${user.name ?? ""}');

      // Navigate based on Laravel user role
      if (user.role == 'teacher') {
        Navigator.pushReplacementNamed(context, AppRoutes.teacherDashboard);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.studentDashboard);
      }
    } catch (e) {
      if (!mounted) return;
      Helpers.showErrorSnackbar(context, e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.school, size: 70, color: AppColors.primary),
                const SizedBox(height: 16),
                const Text(
                  AppStrings.appName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.loginSubtitle,
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.forgotPassword);
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Sign In',
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
