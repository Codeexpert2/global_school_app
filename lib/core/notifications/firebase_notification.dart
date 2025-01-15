import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/core/log/app_logs.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationService.instance.setupFlutterNotifications();
  await NotificationService.instance.showNotification(message);
}

/// NotificationService.instance.initialize();
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> initialize() async {
    AppLog.debug('Notification Service initialize');

    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler,
    );

    // Request permission
    await _requestPermission();

    // Setup message handlers
    await _setupMessageHandlers();

    await _subscribeToTopic();

    // Get FCM token
    await _getToken();
  }

  Future<void> _requestPermission() async {
    // ignore: unused_local_variable
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    // android setup
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios setup
    final initializationSettingsDarwin = const DarwinInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // flutter notification setup
    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );

    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    AppLog.debug('notification.title: ${notification?.title}');

    if (notification != null && android != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  Future<void> _setupMessageHandlers() async {
    // foreground message
    FirebaseMessaging.onMessage.listen(showNotification);

    // background message
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // opened app
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    AppLog.debug('message: ${message.notification?.title}');
    AppLog.debug('message: ${message.notification?.body}');
    if (message.data['type'] == 'chat') {
      // open chat screen
    }
  }

  Future<String?> _getToken() async {
    try {
      String? token;
      FirebaseMessaging.instance.getToken().then((String? token) {
        AppLog.debug('FCM Token: $token');

        // save the new token to your server
        // final notificationStroage = locator<NotificationStroage>();
        // notificationStroage.saveFCMToken(token);
      });

      FirebaseMessaging.instance.onTokenRefresh.listen((String? token) {
        AppLog.debug('onTokenRefresh: $token');

        // save the new token to your server
        // final notificationStroage = locator<NotificationStroage>();
        // notificationStroage.saveFCMToken(token);
      });

      // if (token.isEmptyOrNull) return;
      // debugPrint('token:*****************************************');
      // debugPrint('token: ${token.toString()}');

      // final notificationStroage = locator<NotificationStroage>();
      // if (notificationStroage.isFCMTokenExist(token!)) return;

      // notificationStroage.saveFCMToken(token);
      // final data = locator<DataService>();
      // final info = await DeviceInfoPlugin().androidInfo;

      // /// TODO  type 'Null' is not a subtype of type 'String'
      // /// https://pub.dev/packages/device_info_plus
      // final deviceId = info.id;

      // await data.fcmToken(token, deviceId);

      return token;
    } catch (e) {
      AppLog.error('getToken error: $e');
      return null;
    }
  }

  Future<void> _subscribeToTopic([String? topic]) async {
    await FirebaseMessaging.instance.subscribeToTopic(
      topic ?? AppConfigs.topic,
    );
  }

  Future<void> _unsubscribeFromTopic([String? topic]) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(
      topic ?? AppConfigs.topic,
    );
  }
}
