// To parse this JSON data, do
//
//     final subjectDetails = subjectDetailsFromJson(jsonString);

import 'dart:convert';

SubjectDetails subjectDetailsFromJson(String str) =>
    SubjectDetails.fromJson(json.decode(str));

String subjectDetailsToJson(SubjectDetails data) => json.encode(data.toJson());

class SubjectDetails {
  SubjectDetails({
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

  factory SubjectDetails.fromJson(Map<String, dynamic> json) => SubjectDetails(
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
