import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/notice_model.dart';
import '../services/notice_service.dart';

class NoticesView extends StatefulWidget {
  const NoticesView({super.key});

  @override
  State<NoticesView> createState() => _NoticesViewState();
}

class _NoticesViewState extends State<NoticesView> {
  List<NoticeModel> _notices = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotices();
  }

  Future<void> _loadNotices() async {
    final list = await NoticeService.getNotices();
    if (mounted) {
      setState(() {
        _notices = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notices & Announcements'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _notices.length,
              itemBuilder: (context, index) {
                final item = _notices[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              item.publishedAt,
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.description,
                          style: const TextStyle(color: AppColors.textSecondary, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
