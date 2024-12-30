import 'dart:convert';

import 'package:template/core/keys/keys.dart';
import 'package:template/core/notifications/notification_model.dart';

import 'storage_service.dart';

class NotificationStroage {
  NotificationStroage(this.store);
  final StorageService store;

  // Method to save a bookmark item by its itemId
  void saveNotification(NotificationModel newNotification) {
    // Get all notifications from storage
    List<NotificationModel> allNotifications = getAllNotifications();

    // Check if a notification with the same itemId already exists
    int existingIndex = allNotifications.indexWhere(
      (notification) => notification.id == newNotification.id,
    );

    if (existingIndex != -1) {
      // If a notification with the same itemId exists, update it
      allNotifications[existingIndex] = newNotification;
    } else {
      // If no notification with the same itemId exists, add new notification
      allNotifications.add(newNotification);
    }

    // Save the updated list of notifications back to storage
    saveNotifications(allNotifications);
  }

  // Method to save the list of notification items to storage
  void saveNotifications(List<NotificationModel> notifications) {
    // Convert the list of BookmarkModel objects to a list of JSON maps
    List<Map<String, dynamic>> jsonList =
        notifications.map((notification) => notification.toJson()).toList();

    // Serialize the list of JSON maps to a JSON string
    String jsonString = jsonEncode(jsonList);

    // Save the JSON string to storage
    store.save(notificationKey, jsonString);
  }

  List<NotificationModel> getAllNotifications() {
    // Retrieve the JSON string from storage
    String jsonString = store.read(notificationKey);

    // Return an empty list if no data is found in storage

    if (jsonString.isEmpty) return [];
    // Parse the JSON string into a list of JSON maps
    List<dynamic> jsonList = jsonDecode(jsonString);

    // Convert each JSON map to a NotificationModel object and return the list
    return jsonList.map((json) => NotificationModel.fromJson(json)).toList();
  }

  void updateNotificationInfo(
    String notificationId, {
    required bool seen,
  }) {
    List<NotificationModel> allNotifications = getAllNotifications();
    int existingIndex = allNotifications.indexWhere(
      (notification) => notification.id == notificationId,
    );

    if (existingIndex != -1) {
      allNotifications[existingIndex].seen = seen;

      saveNotifications(allNotifications);
    }
  }

  Future<void> saveFCMToken(String token) async {
    await store.save(fcmTokenKey, token);
  }

  bool isFCMTokenExist(String token) {
    final storedToken = store.read(fcmTokenKey);

    return storedToken == token;
  }
}
