class ApiResponse {
  ApiResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'] ?? '',
      data: json['data'] != null
          ? json['data'] is List
              ? (json['data'] as List)
                  .map((item) => WordWall.fromJson(item))
                  .toList()
              : [WordWall.fromJson(json['data'])]
          : [], 
    );
  }

  final bool success;
  final String message;
  final List<WordWall> data; 
}

class WordWall {
  WordWall({
    required this.id,
    required this.classId,
    required this.sectionId,
    required this.topic,
    this.url,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  factory WordWall.fromJson(Map<String, dynamic> json) {
    return WordWall(
      id: json['id'],
      classId: json['class_id'],
      sectionId: json['section_id'],
      topic: json['topic'] ?? '',
      url: json['url'] ?? '', 
      file: json['file'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'], 
    );
  }

  final int id;
  final int classId;
  final int sectionId;
  final String topic;
  final String? url;
  final String? file;
  final String? createdAt;
  final String? updatedAt;
}
