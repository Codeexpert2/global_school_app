class Accessorie {
  Accessorie({
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

  factory Accessorie.fromJson(Map<String, dynamic> json) => Accessorie(
        id: json['id'],
        classId: json['class_id'],
        sectionId: json['section_id'],
        topic: json['topic'],
        file: json['file'],
        images: json['images'],
        videos: json['videos'],
        url: json['url'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  final int? id;
  final int? classId;
  final int? sectionId;
  final String? topic;
  final String? file;
  final String? images;
  final String? videos;
  final String? url;
  final String? createdAt;
  final String? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'class_id': classId,
        'section_id': sectionId,
        'topic': topic,
        'file': file,
        'images': images,
        'videos': videos,
        'url': url,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
  @override
  String toString() {
    return 'Datum(id: $id, topic: $topic, file: $file, url: $url)';
  }
}
