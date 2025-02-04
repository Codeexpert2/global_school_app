import 'dart:convert';

Certificate certificateFromJson(String str) =>
    Certificate.fromJson(json.decode(str));

String certificateToJson(Certificate data) => json.encode(data.toJson());

class Certificate {
  Certificate({
    this.id,
    this.userId,
    this.gpa,
    this.status,
    this.canView,
    this.createdAt,
    this.updatedAt,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        id: json['id'],
        userId: json['user_id'],
        gpa: json['gpa'],
        status: json['status'],
        canView: json['can_view'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
  final int? id;
  final int? userId;
  final String? gpa;
  final dynamic status;
  final String? canView;
  final dynamic createdAt;
  final dynamic updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'gpa': gpa,
        'status': status,
        'can_view': canView,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
