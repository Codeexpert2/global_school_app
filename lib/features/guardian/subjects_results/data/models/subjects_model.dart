typedef Subjects = List<Subject>;

class SubjectsModel {
  SubjectsModel({
    this.subjects,
  });

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        subjects: json['subjects'] == null
            ? []
            : Subjects.from(
                json['subjects']!.map((x) => Subject.fromJson(x))),
      );
  Subjects? subjects;

  Map<String, dynamic> toJson() => {
        'subjects': subjects == null
            ? []
            : List<dynamic>.from(subjects!.map((x) => x.toJson())),
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
