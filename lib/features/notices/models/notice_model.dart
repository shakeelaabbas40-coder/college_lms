class NoticeModel {
  final int id;
  final String title;
  final String description;
  final String publishedAt;

  NoticeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedAt,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      publishedAt: json['published_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'published_at': publishedAt,
    };
  }
}
