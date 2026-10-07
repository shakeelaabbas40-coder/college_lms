class AttendanceModel {
  final int id;
  final String courseName;
  final String date;
  final String status; // 'Present', 'Absent', 'Leave'

  AttendanceModel({
    required this.id,
    required this.courseName,
    required this.date,
    required this.status,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'] ?? 0,
      courseName: json['course_name'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? 'Present',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'date': date,
      'status': status,
    };
  }
}
