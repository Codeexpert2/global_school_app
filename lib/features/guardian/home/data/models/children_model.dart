List<ChildrenModel> childrenModelFromJson(List<dynamic> lst) =>
    List<ChildrenModel>.from(lst.map((x) => ChildrenModel.fromJson(x)));

class ChildrenModel {
  ChildrenModel({
    this.child,
    this.section,
  });

  factory ChildrenModel.fromJson(Map<String, dynamic> json) => ChildrenModel(
        child: json['child'] == null ? null : Child.fromJson(json['child']),
        section:
            json['section'] == null ? null : Section.fromJson(json['section']),
      );
  Child? child;
  Section? section;
}

class Child {
  Child({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.serialNumber,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        serialNumber: json['serial_number'],
        role: json['role'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );
  int? id;
  String? name;
  String? email;
  dynamic phone;
  dynamic address;
  String? serialNumber;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
}

class Section {
  Section({
    this.id,
    this.edLevelId,
    this.curriculumId,
    this.name,
    this.description,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json['id'],
        edLevelId: json['ed_level_id'],
        curriculumId: json['curriculum_id'],
        name: json['name'],
        description: json['description'],
        code: json['code'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );
  int? id;
  int? edLevelId;
  int? curriculumId;
  String? name;
  String? description;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;
}
