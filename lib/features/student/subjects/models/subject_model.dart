class SubjectModel {
  SubjectModel({
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        success: json['success'],
        message: json['message'],
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
        data: json['data'] == null
            ? []
            : List<Datum>.from(json['data']!.map((x) => Datum.fromJson(x))),
      );
  bool? success;
  String? message;
  Meta? meta;
  List<Datum>? data;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'meta': meta?.toJson(),
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.curriculumId,
    this.name,
    this.level,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.numberSession,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  int? id;
  int? curriculumId;
  String? name;
  String? level;
  dynamic file;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? numberSession;

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
