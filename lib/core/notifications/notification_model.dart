import 'dart:convert';

import '../helpers/date_helper.dart';

class NotificationModel {

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    this.additionalData,
    this.seen = false,
    required this.date,
  });

  factory NotificationModel.fromJson(Map json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      seen: json['seen'],
      additionalData: json['additionalData'],
      date: DateTime.tryParse(json['date']),
    );
  }
  String id;
  String title;
  String body;
  bool seen;
  Map? additionalData;
  DateTime? date;

  String get displayDate {
    final date = this.date;
    if (date == null) return '';
    // final dateDiff = DateTime.now().difference(date);

    return DateHelper.timeAgo(date);
  }

  String? get dynamicLink => additionalData?['dynamic_link'];

  String? get image => additionalData?['image'];

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    bool? seen,
    Map? additionalData,
    DateTime? date,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      seen: seen ?? this.seen,
      body: body ?? this.body,
      additionalData: Map<String, dynamic>.from(
        jsonDecode(
          jsonEncode(additionalData ?? this.additionalData ?? {}),
        ),
      ),
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('title', title);
    writeNotNull('body', body);
    writeNotNull('seen', seen);
    writeNotNull('additionalData', additionalData);
    writeNotNull('date', date.toString());
    return val;
  }
}
