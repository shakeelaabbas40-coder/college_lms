class TimetableModel {
  final int id;
  final String day;
  final String subject;
  final String time;
  final String roomNo;

  TimetableModel({
    required this.id,
    required this.day,
    required this.subject,
    required this.time,
    required this.roomNo,
  });

  factory TimetableModel.fromJson(Map<String, dynamic> json) {
    return TimetableModel(
      id: json['id'] ?? 0,
      day: json['day'] ?? 'Monday',
      subject: json['subject'] ?? '',
      time: json['time'] ?? '',
      roomNo: json['room_no'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'subject': subject,
      'time': time,
      'room_no': roomNo,
    };
  }
}
