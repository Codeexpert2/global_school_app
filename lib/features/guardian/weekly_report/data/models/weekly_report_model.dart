class WeeklyReportModel {
  WeeklyReportModel({
    this.id,
    this.userId,
    this.childAcademicPerformance,
    this.workSheetsCompletion,
    this.projectsCompletion,
    this.participationAndInteraction,
    this.listeningAndObservation,
    this.attendanceAndAbsence,
    this.behaviorInClassAndSchool,
    this.healthyFoodCommitment,
    this.schoolUniformCommitment,
    this.arabicMaterialLevel,
    this.englishMaterialLevel,
    this.excellenceInSubject,
    this.difficultyInSubject,
    this.nails,
    this.hair,
    this.clothing,
    this.note,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  factory WeeklyReportModel.fromJson(Map<String, dynamic> json) =>
      WeeklyReportModel(
        id: json['id'],
        userId: json['user_id'],
        childAcademicPerformance: json['child_academic_performance'],
        workSheetsCompletion: json['work_sheets_completion'],
        projectsCompletion: json['projects_completion'],
        participationAndInteraction: json['participation_and_interaction'],
        listeningAndObservation: json['listening_and_observation'],
        attendanceAndAbsence: json['attendance_and_absence'],
        behaviorInClassAndSchool: json['behavior_in_class_and_school'],
        healthyFoodCommitment: json['healthy_food_commitment'],
        schoolUniformCommitment: json['school_uniform_commitment'],
        arabicMaterialLevel: json['arabic_material_level'],
        englishMaterialLevel: json['english_material_level'],
        excellenceInSubject: json['excellence_in_subject'],
        difficultyInSubject: json['difficulty_in_subject'],
        nails: json['nails'],
        hair: json['hair'],
        clothing: json['clothing'],
        note: json['note'],
        date: json['date'] == null ? null : DateTime.parse(json['date']),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );
  int? id;
  int? userId;
  String? childAcademicPerformance;
  String? workSheetsCompletion;
  String? projectsCompletion;
  String? participationAndInteraction;
  String? listeningAndObservation;
  String? attendanceAndAbsence;
  String? behaviorInClassAndSchool;
  String? healthyFoodCommitment;
  String? schoolUniformCommitment;
  String? arabicMaterialLevel;
  String? englishMaterialLevel;
  String? excellenceInSubject;
  String? difficultyInSubject;
  String? nails;
  String? hair;
  String? clothing;
  String? note;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'child_academic_performance': childAcademicPerformance,
        'work_sheets_completion': workSheetsCompletion,
        'projects_completion': projectsCompletion,
        'participation_and_interaction': participationAndInteraction,
        'listening_and_observation': listeningAndObservation,
        'attendance_and_absence': attendanceAndAbsence,
        'behavior_in_class_and_school': behaviorInClassAndSchool,
        'healthy_food_commitment': healthyFoodCommitment,
        'school_uniform_commitment': schoolUniformCommitment,
        'arabic_material_level': arabicMaterialLevel,
        'english_material_level': englishMaterialLevel,
        'excellence_in_subject': excellenceInSubject,
        'difficulty_in_subject': difficultyInSubject,
        'nails': nails,
        'hair': hair,
        'clothing': clothing,
        'note': note,
        'date':
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
