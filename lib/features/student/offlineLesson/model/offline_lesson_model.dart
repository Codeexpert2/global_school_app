// To parse this JSON data, do
//
//     final offlineLessonModel = offlineLessonModelFromJson(jsonString);

import 'dart:convert';

OfflineLessonModel offlineLessonModelFromJson(String str) =>
    OfflineLessonModel.fromJson(json.decode(str));

String offlineLessonModelToJson(OfflineLessonModel data) =>
    json.encode(data.toJson());

class OfflineLessonModel {
  OfflineLessonModel({
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory OfflineLessonModel.fromJson(Map<String, dynamic> json) =>
      OfflineLessonModel(
        success: json['success'],
        message: json['message'],
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
        data: json['data'] == null
            ? []
            : List<OfflineLesson>.from(
                json['data']!.map((x) => OfflineLesson.fromJson(x))),
      );
  bool? success;
  String? message;
  Meta? meta;
  List<OfflineLesson>? data;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'meta': meta?.toJson(),
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OfflineLesson {
  OfflineLesson({
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

  factory OfflineLesson.fromJson(Map<String, dynamic> json) => OfflineLesson(
        id: json['id'],
        classId: json['class_id'],
        sectionId: json['section_id'],
        topic: json['topic'],
        file: json['file'],
        images: json['images'],
        videos: json['videos'],
        url: json['url'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );
  int? id;
  int? classId;
  int? sectionId;
  String? topic;
  dynamic file;
  String? images;
  String? videos;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;

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
        hasMore: json['has_more'],
        hasPrev: json['has_prev'],
      );
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;
  bool? hasMore;
  bool? hasPrev;

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'last_page': lastPage,
        'per_page': perPage,
        'total': total,
        'has_more': hasMore,
        'has_prev': hasPrev,
      };
}
