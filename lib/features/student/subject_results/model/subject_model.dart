class SubjectsModel {
  SubjectsModel({
    this.subjects,
  });

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        subjects: json['subjects'] == null
            ? []
            : List<Subject>.from(
                json['subjects']!.map((x) => Subject.fromJson(x))),
      );
  List<Subject>? subjects;

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
        level: levelValues.map[json['level']]!,
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
  Level? level;
  dynamic file;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? numberSession;

  Map<String, dynamic> toJson() => {
        'id': id,
        'curriculum_id': curriculumId,
        'name': name,
        'level': levelValues.reverse[level],
        'file': file,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'number_session': numberSession,
      };
}

enum Level { LEVEL_9 }

final levelValues = EnumValues({'Level 9': Level.LEVEL_9});

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
