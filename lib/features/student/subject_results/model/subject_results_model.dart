class SubjectResultsModel {
  SubjectResultsModel({
    this.subjectResults,
  });

  factory SubjectResultsModel.fromJson(Map<String, dynamic> json) =>
      SubjectResultsModel(
        subjectResults: json['SubjectResults'] == null
            ? []
            : List<SubjectResult>.from(
                json['SubjectResults']!.map((x) => SubjectResult.fromJson(x))),
      );
  List<SubjectResult>? subjectResults;

  Map<String, dynamic> toJson() => {
        'SubjectResults': subjectResults == null
            ? []
            : List<dynamic>.from(subjectResults!.map((x) => x.toJson())),
      };
}

class SubjectResult {
  SubjectResult({
    this.subjectId,
    this.subjectName,
    this.semester,
    this.exam,
    this.worksheets,
    this.study,
    this.noteBook,
    this.examGrade,
    this.studyGrade,
    this.note,
    this.createdAt,
  });

  factory SubjectResult.fromJson(Map<String, dynamic> json) => SubjectResult(
        subjectId: json['subject_id'],
        subjectName: json['subject_name'],
        semester: json['semester'],
        exam: json['exam'],
        worksheets: json['worksheets'],
        study: json['study'],
        noteBook: json['noteBook'],
        examGrade: json['exam_grade'],
        studyGrade: json['study_grade'],
        note: json['note'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
      );
  int? subjectId;
  String? subjectName;
  String? semester;
  int? exam;
  int? worksheets;
  int? study;
  int? noteBook;
  String? examGrade;
  String? studyGrade;
  String? note;
  DateTime? createdAt;

  Map<String, dynamic> toJson() => {
        'subject_id': subjectId,
        'subject_name': subjectName,
        'semester': semester,
        'exam': exam,
        'worksheets': worksheets,
        'study': study,
        'noteBook': noteBook,
        'exam_grade': examGrade,
        'study_grade': studyGrade,
        'note': note,
        'created_at': createdAt?.toIso8601String(),
      };
}
