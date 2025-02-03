import 'dart:convert';

AccessoryResponse accessoryResponseFromJson(String str) =>
    AccessoryResponse.fromJson(json.decode(str));

String accessoryResponseToJson(AccessoryResponse data) =>
    json.encode(data.toJson());

class AccessoryResponse {
  AccessoryResponse({
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory AccessoryResponse.fromJson(Map<String, dynamic> json) =>
      AccessoryResponse(
        success: json['success'] ?? false,
        message: json['message'] ?? '',
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
        data: json['data'] == null
            ? []
            : List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  final bool? success;
  final String? message;
  final Meta? meta;
  final List<Datum>? data;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'meta': meta?.toJson(),
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.hasMore,
    this.hasPrev,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        perPage: json['per_page'],
        total: json['total'],
        hasMore: json['has_more'] ?? false,
        hasPrev: json['has_prev'] ?? false,
      );

  final int? currentPage;
  final int? lastPage;
  final int? perPage;
  final int? total;
  final bool? hasMore;
  final bool? hasPrev;

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'last_page': lastPage,
        'per_page': perPage,
        'total': total,
        'has_more': hasMore,
        'has_prev': hasPrev,
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
