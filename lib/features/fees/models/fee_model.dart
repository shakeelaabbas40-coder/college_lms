class FeeModel {
  final int id;
  final String title;
  final String challanNumber;
  final double amount;
  final String dueDate;
  final String status; // 'Paid', 'Unpaid', 'Pending'

  FeeModel({
    required this.id,
    required this.title,
    required this.challanNumber,
    required this.amount,
    required this.dueDate,
    required this.status,
  });

  factory FeeModel.fromJson(Map<String, dynamic> json) {
    return FeeModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Semester Fee',
      challanNumber: json['challan_number'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      dueDate: json['due_date'] ?? '',
      status: json['status'] ?? 'Unpaid',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'challan_number': challanNumber,
      'amount': amount,
      'due_date': dueDate,
      'status': status,
    };
  }
}
