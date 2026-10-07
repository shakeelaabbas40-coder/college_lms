class ResultModel {
  final int id;
  final String courseName;
  final double obtainedMarks;
  final double totalMarks;
  final String grade;

  ResultModel({
    required this.id,
    required this.courseName,
    required this.obtainedMarks,
    required this.totalMarks,
    required this.grade,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'] ?? 0,
      courseName: json['course_name'] ?? '',
      obtainedMarks: (json['obtained_marks'] ?? 0).toDouble(),
      totalMarks: (json['total_marks'] ?? 100).toDouble(),
      grade: json['grade'] ?? 'N/A',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'obtained_marks': obtainedMarks,
      'total_marks': totalMarks,
      'grade': grade,
    };
  }
}
