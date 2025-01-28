// To parse this JSON data, do
//
//     final examModel = examModelFromJson(jsonString);

import 'dart:convert';

ExamModel examModelFromJson(String str) => ExamModel.fromJson(json.decode(str));

String examModelToJson(ExamModel data) => json.encode(data.toJson());

class ExamModel {
  ExamModel({
    this.success,
    this.message,
    this.data,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
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
    this.topic,
    this.date,
    this.startTime,
    this.endTime,
    this.mark,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.semester,
    this.pivot,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'],
        topic: json['topic'],
        date: json['date'] == null ? null : DateTime.parse(json['date']),
        startTime: json['start_time'],
        endTime: json['end_time'],
        mark: json['mark'],
        video: json['video'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        semester: json['semester'],
        pivot: json['pivot'] == null ? null : Pivot.fromJson(json['pivot']),
      );
  final int? id;
  final String? topic;
  final DateTime? date;
  final String? startTime;
  final String? endTime;
  final int? mark;
  final dynamic video;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? semester;
  final Pivot? pivot;

  Map<String, dynamic> toJson() => {
        'id': id,
        'topic': topic,
        'date':
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        'start_time': startTime,
        'end_time': endTime,
        'mark': mark,
        'video': video,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'semester': semester,
        'pivot': pivot?.toJson(),
      };
}

class Pivot {
  Pivot({
    this.userId,
    this.examId,
    this.loginExam,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json['user_id'],
        examId: json['exam_id'],
        loginExam: json['login_exam'],
      );
  final int? userId;
  final int? examId;
  final int? loginExam;

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'exam_id': examId,
        'login_exam': loginExam,
      };
}

