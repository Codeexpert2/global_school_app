class AuthModel {
  AuthModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null ? null : Data.fromJson(json['data']),
        token: json['token'],
      );
  bool? status;
  String? message;
  Data? data;
  String? token;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
        'token': token,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.userName,
    this.serialNumber,
    this.installment,
    this.installmentBefor,
    this.image,
    this.emailVerifiedAt,
    this.zoomAccountId,
    this.zoomClientId,
    this.zoomClientSecret,
    this.clientId,
    this.clientSecret,
    this.parentId,
    this.addressDetailed,
    this.vaccineCurrentAge,
    this.permanentRecurringHealthDetails,
    this.medicineDetails,
    this.difficultyLearningDetails,
    this.psychologicalTraumaDetails,
    this.studentCharacteristics,
    this.detailingTalent,
    this.workParent,
    this.motherPhone,
    this.parentPhone,
    this.gender,
    this.birthplaceCity,
    this.birthplaceCountry,
    this.dateOfBirth,
    this.identificationNumber,
    this.fullNameTurkish,
    this.parentEducationLevel,
    this.motherName,
    this.whatsappGroupNumber,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        userName: json['userName'],
        serialNumber: json['serial_number'],
        installment: json['Installment'],
        installmentBefor: json['Installment_befor'],
        image: json['image'],
        emailVerifiedAt: json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at']),
        zoomAccountId: json['zoom_account_id'],
        zoomClientId: json['zoom_client_id'],
        zoomClientSecret: json['zoom_client_secret'],
        clientId: json['CLIENT_ID'],
        clientSecret: json['CLIENT_SECRET'],
        parentId: json['parent_id'],
        addressDetailed: json['address_detailed'],
        vaccineCurrentAge: json['vaccine_current_age'],
        permanentRecurringHealthDetails:
            json['permanent_recurring_health_details'],
        medicineDetails: json['medicine_details'],
        difficultyLearningDetails: json['difficulty_learning_details'],
        psychologicalTraumaDetails: json['psychological_trauma_details'],
        studentCharacteristics: json['student_characteristics'],
        detailingTalent: json['detailing_talent'],
        workParent: json['work_parent'],
        motherPhone: json['mother_phone'],
        parentPhone: json['parent_phone'],
        gender: json['gender'],
        birthplaceCity: json['birthplace_city'],
        birthplaceCountry: json['birthplace_country'],
        dateOfBirth: json['date_of_birth'],
        identificationNumber: json['identification_number'],
        fullNameTurkish: json['full_name_turkish'],
        parentEducationLevel: json['parent_education_level'],
        motherName: json['mother_name'],
        whatsappGroupNumber: json['whatsapp_group_number'],
        note: json['note'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        roles: json['roles'] == null
            ? []
            : List<Role>.from(json['roles']!.map((x) => Role.fromJson(x))),
      );
  int? id;
  String? name;
  String? email;
  dynamic phone;
  dynamic address;
  dynamic userName;
  dynamic serialNumber;
  dynamic installment;
  dynamic installmentBefor;
  dynamic image;
  DateTime? emailVerifiedAt;
  dynamic zoomAccountId;
  dynamic zoomClientId;
  dynamic zoomClientSecret;
  dynamic clientId;
  dynamic clientSecret;
  dynamic parentId;
  dynamic addressDetailed;
  dynamic vaccineCurrentAge;
  dynamic permanentRecurringHealthDetails;
  dynamic medicineDetails;
  dynamic difficultyLearningDetails;
  dynamic psychologicalTraumaDetails;
  dynamic studentCharacteristics;
  dynamic detailingTalent;
  dynamic workParent;
  dynamic motherPhone;
  dynamic parentPhone;
  dynamic gender;
  dynamic birthplaceCity;
  dynamic birthplaceCountry;
  dynamic dateOfBirth;
  dynamic identificationNumber;
  dynamic fullNameTurkish;
  dynamic parentEducationLevel;
  dynamic motherName;
  dynamic whatsappGroupNumber;
  dynamic note;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Role>? roles;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'userName': userName,
        'serial_number': serialNumber,
        'Installment': installment,
        'Installment_befor': installmentBefor,
        'image': image,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'zoom_account_id': zoomAccountId,
        'zoom_client_id': zoomClientId,
        'zoom_client_secret': zoomClientSecret,
        'CLIENT_ID': clientId,
        'CLIENT_SECRET': clientSecret,
        'parent_id': parentId,
        'address_detailed': addressDetailed,
        'vaccine_current_age': vaccineCurrentAge,
        'permanent_recurring_health_details': permanentRecurringHealthDetails,
        'medicine_details': medicineDetails,
        'difficulty_learning_details': difficultyLearningDetails,
        'psychological_trauma_details': psychologicalTraumaDetails,
        'student_characteristics': studentCharacteristics,
        'detailing_talent': detailingTalent,
        'work_parent': workParent,
        'mother_phone': motherPhone,
        'parent_phone': parentPhone,
        'gender': gender,
        'birthplace_city': birthplaceCity,
        'birthplace_country': birthplaceCountry,
        'date_of_birth': dateOfBirth,
        'identification_number': identificationNumber,
        'full_name_turkish': fullNameTurkish,
        'parent_education_level': parentEducationLevel,
        'mother_name': motherName,
        'whatsapp_group_number': whatsappGroupNumber,
        'note': note,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'roles': roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'],
        name: json['name'],
        guardName: json['guard_name'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        pivot: json['pivot'] == null ? null : Pivot.fromJson(json['pivot']),
      );
  int? id;
  String? name;
  String? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'guard_name': guardName,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'pivot': pivot?.toJson(),
      };
}

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json['model_id'],
        roleId: json['role_id'],
        modelType: json['model_type'],
      );
  int? modelId;
  int? roleId;
  String? modelType;

  Map<String, dynamic> toJson() => {
        'model_id': modelId,
        'role_id': roleId,
        'model_type': modelType,
      };
}
