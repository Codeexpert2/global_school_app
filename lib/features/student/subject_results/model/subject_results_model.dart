// subjectresults_model.dart
import 'dart:convert';

SubjectresultsModel subjectresultsModelFromJson(String str) =>
    SubjectresultsModel.fromJson(json.decode(str));

String subjectresultsModelToJson(SubjectresultsModel data) =>
    json.encode(data.toJson());

class SubjectresultsModel {
  SubjectresultsModel({
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory SubjectresultsModel.fromJson(Map<String, dynamic> json) =>
      SubjectresultsModel(
        success: json['success'],
        message: json['message'],
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
        data: json['data'] == null
            ? []
            : List<Subjectresults>.from(json['data']!.map((x) => Subjectresults.fromJson(x))),
      );
  final bool? success;
  final String? message;
  final Meta? meta;
  final List<Subjectresults>? data;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'meta': meta?.toJson(),
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Subjectresults {
  Subjectresults({
    this.id,
    this.userId,
    this.subjectId,
    this.semester,
    this.exam,
    this.examGrade,
    this.studyGrade,
    this.study,
    this.noteBook,
    this.worksheets,
    this.createdAt,
    this.updatedAt,
    this.subject,
  });

  factory Subjectresults.fromJson(Map<String, dynamic> json) => Subjectresults(
        id: json['id'],
        userId: json['user_id'],
        subjectId: json['subject_id'],
        semester: json['semester'],
        exam: json['exam'],
        examGrade: json['exam_grade'],
        studyGrade: json['study_grade'],
        study: json['study'],
        noteBook: json['noteBook'],
        worksheets: json['worksheets'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        subject:
            json['subject'] == null ? null : Subject.fromJson(json['subject']),
      );
  final int? id;
  final int? userId;
  final int? subjectId;
  final String? semester;
  final int? exam;
  final dynamic examGrade;
  final dynamic studyGrade;
  final int? study;
  final int? noteBook;
  final int? worksheets;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Subject? subject;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'subject_id': subjectId,
        'semester': semester,
        'exam': exam,
        'exam_grade': examGrade,
        'study_grade': studyGrade,
        'study': study,
        'noteBook': noteBook,
        'worksheets': worksheets,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'subject': subject?.toJson(),
      };
}

class Subject {
  Subject({
    this.id,
    this.curriculumId,
    this.name,
    this.level,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.numberSession,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json['id'],
        curriculumId: json['curriculum_id'],
        name: json['name'],
        level: json['level'],
        file: json['file'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        numberSession: json['number_session'],
      );
  final int? id;
  final int? curriculumId;
  final String? name;
  final String? level;
  final dynamic file;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? numberSession;

  Map<String, dynamic> toJson() => {
        'id': id,
        'curriculum_id': curriculumId,
        'name': name,
        'level': level,
        'file': file,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'number_session': numberSession,
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
