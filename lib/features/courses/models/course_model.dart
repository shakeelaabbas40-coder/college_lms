class CourseModel {
  final int id;
  final String code;
  final String name;
  final String teacherName;
  final int creditHours;

  CourseModel({
    required this.id,
    required this.code,
    required this.name,
    required this.teacherName,
    required this.creditHours,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      teacherName: json['teacher_name'] ?? 'Faculty Member',
      creditHours: json['credit_hours'] ?? 3,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'teacher_name': teacherName,
      'credit_hours': creditHours,
    };
  }
}
