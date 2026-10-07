class ProfileModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String department;
  final String studentId;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.department,
    required this.studentId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'College Student',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '+92 300 1234567',
      department: json['department'] ?? 'Computer Science',
      studentId: json['student_id'] ?? 'BSCS-2023-042',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'department': department,
      'student_id': studentId,
    };
  }
}
