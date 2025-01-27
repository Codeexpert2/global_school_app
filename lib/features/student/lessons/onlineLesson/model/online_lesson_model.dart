import 'dart:convert';

OnlineLessonModel onlineLessonModelFromJson(String str) =>
    OnlineLessonModel.fromJson(json.decode(str));

String onlineLessonModelToJson(OnlineLessonModel data) =>
    json.encode(data.toJson());

class OnlineLessonModel {
  factory OnlineLessonModel.fromJson(Map<String, dynamic> json) =>
      OnlineLessonModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null ? null : Data.fromJson(json['data']),
        token: json['token'],
      );

  OnlineLessonModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  final bool? status;
  final String? message;
  final Data? data;
  final dynamic token;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
        'token': token,
      };
}

class Data {
  Data({
    this.totalCount,
    this.courses,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalCount: json['total_count'],
        courses: json['courses'] == null
            ? []
            : List<Course>.from(
                json['courses']!.map((x) => Course.fromJson(x))),
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

  final int? totalCount;
  final List<Course>? courses;
  final int? id;
  final int? subjectId;
  final String? meetingId;
  final String? creatingBy;
  final String? creatingByName;
  final String? topic;
  final DateTime? day;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? duration;
  final String? password;
  final String? startUrl;
  final String? joinUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic sectionId;

  Map<String, dynamic> toJson() => {
        'total_count': totalCount,
        'courses': courses == null
            ? []
            : List<dynamic>.from(courses!.map((x) => x.toJson())),
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

class Course {
  factory Course.fromJson(Map<String, dynamic> json) => Course(
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

  Course({
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

  final int? id;
  final int? subjectId;
  final String? meetingId;
  final String? creatingBy;
  final String? creatingByName;
  final String? topic;
  final DateTime? day;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? duration;
  final String? password;
  final String? startUrl;
  final String? joinUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic sectionId;

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