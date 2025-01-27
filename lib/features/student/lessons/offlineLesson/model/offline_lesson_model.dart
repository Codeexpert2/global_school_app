class OfflineLessonModel {
  factory OfflineLessonModel.fromJson(Map<String, dynamic> json) {
    return OfflineLessonModel(
      id: json['id'],
      classId: json['class_id'],
      sectionId: json['section_id'],
      topic: json['topic'],
      file: json['file'],
      images: json['images'],
      videos: json['videos'],
      url: json['url'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  OfflineLessonModel({
    this.id,
    this.classId,
    this.sectionId,
    this.topic,
    this.file,
    this.images,
    this.videos,
    this.url,
    this.createdAt,
    this.updatedAt,
  });
  final int? id;
  final int? classId;
  final int? sectionId;
  final String? topic;
  final dynamic file;
  final dynamic images;
  final String? videos;
  final dynamic url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'class_id': classId,
        'section_id': sectionId,
        'topic': topic,
        'file': file,
        'images': images,
        'videos': videos,
        'url': url,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

class OfflineLessonListResponse {
  OfflineLessonListResponse({
    required this.totalCount,
    required this.lessons,
  });

  factory OfflineLessonListResponse.fromJson(Map<String, dynamic> json) {
    return OfflineLessonListResponse(
      totalCount: json['total_count'],
      lessons: (json['lessons'] as List)
          .map((lesson) => OfflineLessonModel.fromJson(lesson))
          .toList(),
    );
  }
  final int totalCount;
  final List<OfflineLessonModel> lessons;
}
