// To parse this JSON data, do
//
//     final recordedLessonModel = recordedLessonModelFromJson(jsonString);

import 'dart:convert';

RecordedLesson recordedLessonModelFromJson(String str) =>
    RecordedLesson.fromJson(json.decode(str));

String recordedLessonModelToJson(RecordedLesson data) =>
    json.encode(data.toJson());

class RecordedLesson {
  RecordedLesson({
    this.success,
    this.message,
    this.data,
  });

  factory RecordedLesson.fromJson(Map<String, dynamic> json) => RecordedLesson(
        success: json['success'],
        message: json['message'],
        data: json['data'] == null
            ? []
            : List<Datum>.from(json['data']!.map((x) => Datum.fromJson(x))),
      );
  final bool? success;
  final String? message;
  final List<Datum>? data;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.subjectId,
    this.title,
    this.url,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'],
        subjectId: json['subject_id'],
        title: json['title'],
        url: json['url'],
        description: json['description'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );
  final int? id;
  final int? subjectId;
  final String? title;
  final String? url;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'subject_id': subjectId,
        'title': title,
        'url': url,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
