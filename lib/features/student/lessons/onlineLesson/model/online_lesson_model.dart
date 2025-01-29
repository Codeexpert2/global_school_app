// To parse this JSON data, do
//
//     final onlineLessonModel = onlineLessonModelFromJson(jsonString);

import 'dart:convert';

OnlineLessonModel onlineLessonModelFromJson(String str) =>
    OnlineLessonModel.fromJson(json.decode(str));

String onlineLessonModelToJson(OnlineLessonModel data) =>
    json.encode(data.toJson());

class OnlineLessonModel {
  OnlineLessonModel({
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory OnlineLessonModel.fromJson(Map<String, dynamic> json) =>
      OnlineLessonModel(
        success: json['success'],
        message: json['message'],
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
        data: json['data'] == null
            ? []
            : List<OnlineLesson>.from(
                json['data']!.map((x) => OnlineLesson.fromJson(x))),
      );
  bool? success;
  String? message;
  Meta? meta;
  List<OnlineLesson>? data;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'meta': meta?.toJson(),
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OnlineLesson {
  OnlineLesson({
    this.id,
    this.subjectId,
    this.meetingId,
    this.creatingBy,
    this.creatingByName,
    this.topic,
    this.day,
    this.startTime,
    this.endTime,
    this.duration,
    this.password,
    this.startUrl,
    this.joinUrl,
    this.createdAt,
    this.updatedAt,
    this.sectionId,
  });

  factory OnlineLesson.fromJson(Map<String, dynamic> json) => OnlineLesson(
        id: json['id'],
        subjectId: json['subject_id'],
        meetingId: json['meeting_id'],
        creatingBy: json['creating_by'],
        creatingByName: json['creating_by_name'],
        topic: json['topic'],
        day: json['day'] == null ? null : DateTime.parse(json['day']),
        startTime: json['start_time'] == null
            ? null
            : DateTime.parse(json['start_time']),
        endTime:
            json['end_time'] == null ? null : DateTime.parse(json['end_time']),
        duration: json['duration'],
        password: json['password'],
        startUrl: json['start_url'],
        joinUrl: json['join_url'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        sectionId: json['section_id'],
      );
  int? id;
  int? subjectId;
  String? meetingId;
  String? creatingBy;
  String? creatingByName;
  String? topic;
  DateTime? day;
  DateTime? startTime;
  DateTime? endTime;
  int? duration;
  String? password;
  String? startUrl;
  String? joinUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic sectionId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'subject_id': subjectId,
        'meeting_id': meetingId,
        'creating_by': creatingBy,
        'creating_by_name': creatingByName,
        'topic': topic,
        'day': day?.toIso8601String(),
        'start_time': startTime?.toIso8601String(),
        'end_time': endTime?.toIso8601String(),
        'duration': duration,
        'password': password,
        'start_url': startUrl,
        'join_url': joinUrl,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'section_id': sectionId,
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
