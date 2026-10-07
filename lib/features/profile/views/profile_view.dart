import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../auth/services/auth_service.dart';
import '../models/profile_model.dart';
import '../services/profile_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileModel? _profile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final data = await ProfileService.getProfile();
    if (mounted) {
      setState(() {
        _profile = data;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColors.primary,
                        child: Text(
                          (_profile != null && _profile!.name.isNotEmpty)
                              ? _profile!.name[0].toUpperCase()
                              : 'S',
                          style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _profile?.name ?? 'Student Name',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Roll No: ${_profile?.studentId}',
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.email_outlined, color: AppColors.primary),
                        title: const Text('Email Address'),
                        subtitle: Text(_profile?.email ?? ''),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.phone_outlined, color: AppColors.primary),
                        title: const Text('Phone Number'),
                        subtitle: Text(_profile?.phone ?? ''),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.domain_outlined, color: AppColors.primary),
                        title: const Text('Department'),
                        subtitle: Text(_profile?.department ?? ''),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ListTile(
                  tileColor: Colors.red.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Sign Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  onTap: () async {
                    await AuthService.logout();
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
                    }
                  },
                ),
              ],
            ),
    );
  }
}
