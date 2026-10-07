class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? role; // 'student', 'teacher', 'admin'
  final String? studentId;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.studentId,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UserModel();
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'] ?? 'student',
      studentId: json['student_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'student_id': studentId,
    };
  }
}
