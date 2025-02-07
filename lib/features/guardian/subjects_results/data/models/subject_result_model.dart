List<SubjectResultModel> listSubjectResultModelFromJson(List<dynamic> lst) =>
    List<SubjectResultModel>.from(
        lst.map((x) => SubjectResultModel.fromJson(x)));

class SubjectResultModel {
  SubjectResultModel({
    this.subjectName,
    this.semester,
    this.exam,
    this.worksheets,
    this.study,
    this.noteBook,
    this.examGrade,
    this.studyGrade,
  });

  factory SubjectResultModel.fromJson(Map<String, dynamic> json) =>
      SubjectResultModel(
        subjectName: json['subject_name'],
        semester: json['semester'],
        exam: json['exam'],
        worksheets: json['worksheets'],
        study: json['study'],
        noteBook: json['noteBook'],
        examGrade: json['exam_grade'],
        studyGrade: json['study_grade'],
      );
  String? subjectName;
  String? semester;
  int? exam;
  int? worksheets;
  int? study;
  int? noteBook;
  dynamic examGrade;
  dynamic studyGrade;
}
