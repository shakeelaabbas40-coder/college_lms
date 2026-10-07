import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/fee_model.dart';
import '../services/fee_service.dart';

class FeesView extends StatefulWidget {
  const FeesView({super.key});

  @override
  State<FeesView> createState() => _FeesViewState();
}

class _FeesViewState extends State<FeesView> {
  List<FeeModel> _fees = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFees();
  }

  Future<void> _loadFees() async {
    final list = await FeeService.getFees();
    if (mounted) {
      setState(() {
        _fees = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee Challans & Dues'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _fees.length,
              itemBuilder: (context, index) {
                final item = _fees[index];
                final isPaid = item.status.toLowerCase() == 'paid';
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Challan: ${item.challanNumber} • Due: ${item.dueDate}\nAmount: Rs. ${item.amount.toStringAsFixed(0)}'),
                    isThreeLine: true,
                    trailing: Chip(
                      label: Text(
                        item.status,
                        style: TextStyle(color: isPaid ? Colors.green.shade800 : Colors.red.shade800),
                      ),
                      backgroundColor: isPaid ? Colors.green.shade50 : Colors.red.shade50,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
