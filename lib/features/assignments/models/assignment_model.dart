class AssignmentModel {
  final int id;
  final String title;
  final String courseName;
  final String dueDate;
  final int totalMarks;
  final bool isSubmitted;
  final String description;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.courseName,
    required this.dueDate,
    required this.totalMarks,
    required this.isSubmitted,
    required this.description,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      courseName: json['course_name'] ?? '',
      dueDate: json['due_date'] ?? '',
      totalMarks: json['total_marks'] ?? 10,
      isSubmitted: json['is_submitted'] ?? false,
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'course_name': courseName,
      'due_date': dueDate,
      'total_marks': totalMarks,
      'is_submitted': isSubmitted,
      'description': description,
    };
  }
}
