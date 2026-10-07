class DashboardSummaryModel {
  final int totalCourses;
  final double attendancePercentage;
  final int pendingAssignments;
  final int unreadNotices;

  DashboardSummaryModel({
    this.totalCourses = 0,
    this.attendancePercentage = 0.0,
    this.pendingAssignments = 0,
    this.unreadNotices = 0,
  });

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) {
    return DashboardSummaryModel(
      totalCourses: json['total_courses'] ?? 0,
      attendancePercentage: (json['attendance_percentage'] ?? 0).toDouble(),
      pendingAssignments: json['pending_assignments'] ?? 0,
      unreadNotices: json['unread_notices'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_courses': totalCourses,
      'attendance_percentage': attendancePercentage,
      'pending_assignments': pendingAssignments,
      'unread_notices': unreadNotices,
    };
  }
}
