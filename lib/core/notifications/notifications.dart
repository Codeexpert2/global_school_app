// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:global_school/configs/app_configs.dart';
// import 'package:global_school/core/constants/images.dart';
// import 'package:global_school/core/extensions/extensions.dart';
// import 'package:global_school/core/keys/keys.dart';
// import 'package:global_school/core/themes/app_colors.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'notification_model.dart';

// const String mySound = 'slow_spring_board';

// /// To verify that your messages are being received, you ought to see a
// /// notification appearon your device/emulator via the flutter_local_notifications.
// /// Define a top-level named handler which background/terminated messages will
// /// call. Be sure to annotate the handler with `@pragma('vm:entry-point')`
// /// above the function declaration.
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await setupFlutterNotifications();
//   showFlutterNotification(message);
//   // If you're use other Firebase services in background, like Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   debugPrint('Handling a background message ${message.messageId}');
// }

// /// Create a [AndroidNotificationChannel] for heads up notifications
// late AndroidNotificationChannel channel;

// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

// bool isFlutterLocalNotificationsInitialized = false;

// Future<void> setupFlutterNotifications() async {
//   if (isFlutterLocalNotificationsInitialized) return;

//   channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//     sound: RawResourceAndroidNotificationSound(
//       mySound,
//     ),
//   );

//   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   /// Create an Android Notification Channel.
//   ///
//   /// We use this channel in the `AndroidManifest.xml` file to override the
//   /// default FCM channel to enable heads up notifications.
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   /// Update the iOS foreground notification presentation options to allow
//   /// heads up notifications.
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   isFlutterLocalNotificationsInitialized = true;
// }

// void showTestNotification() async {
//   ByteData bytes = await rootBundle.load(AppImages.diplom);
//   var buffer = bytes.buffer;
//   var bufferBytes = Uint8List.view(buffer);
//   // var bodyBytes = base64.encode(bufferBytes);

//   final bigPictureStyleInformation = BigPictureStyleInformation(
//     ByteArrayAndroidBitmap.fromBase64String(
//       base64Encode(bufferBytes),
//     ),
//   );

//   // final String filePath = '${directory.path}/$fileName';
//   // final BigPictureStyleInformation bigPictureStyleInformation =
//   //     BigPictureStyleInformation(
//   //   FilePathAndroidBitmap(filePath),
//   //   largeIcon: FilePathAndroidBitmap(filePath),
//   // );

//   flutterLocalNotificationsPlugin.show(
//     Random().nextInt(1000),
//     'title',
//     'body',
//     NotificationDetails(
//       iOS: const DarwinNotificationDetails(
//         presentAlert: true,
//         presentSound: true,
//         presentBadge: true,
//         sound: 'slow_spring_board.aiff',
//       ),
//       android: AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channelDescription: channel.description,
//         // TODO add a proper drawable resource to android, for now using
//         // one that already exists in example app.
//         icon: 'logo',
//         color: AppColors.secondary500,
//         showProgress: true,
//         progress: 10,
//         maxProgress: 15,
//         ongoing: true,
//         priority: Priority.high,
//         colorized: true,
//         sound: const RawResourceAndroidNotificationSound(
//           mySound,
//         ),
//         playSound: true,
//         importance: Importance.max,
//         styleInformation: bigPictureStyleInformation,
//       ),
//     ),
//   );

//   ProviderScope.containerOf(rootNavigatorKey.currentContext!)
//       .read(notificationsStorageProvider)
//       .saveNotification(
//         NotificationModel(
//           id: '1',
//           title: 'title',
//           body: 'body',
//           // additionalData: data,
//           date: DateTime.now(),
//           seen: false,
//         ),
//       );
// }

// void showFlutterNotification(RemoteMessage message) {
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//   if (notification != null && android != null) {
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           // TODO add a proper drawable resource to android, for now using
//           // one that already exists in example app.
//           icon: 'logo',
//         ),
//       ),
//     );
//   }
//   //
//   // save message data
//   final data = message.data;
//   debugPrint('RemoteMessage:*****************************************');
//   debugPrint(message.messageId);
//   debugPrint(notification?.title);
//   debugPrint(notification?.body);

//   ProviderScope.containerOf(rootNavigatorKey.currentContext!)
//       .read(notificationsStorageProvider)
//       .saveNotification(
//         NotificationModel(
//           id: message.messageId ?? '',
//           title: notification?.title ?? '',
//           body: notification?.body ?? '',
//           additionalData: data,
//           date: DateTime.now(),
//           seen: false,
//         ),
//       );
// }

// void openNotification(RemoteMessage message) {
//   debugPrint('A new onMessageOpenedApp event was published!');
//   debugPrint('message: ${message.data}');
//   // Navigator.pushNamed(
//   //   context,
//   //   '/message',
//   //   arguments: MessageArguments(message, true),
//   // );
// }

// Future<void> requestPermissions() async {
//   NotificationSettings settings =
//       await FirebaseMessaging.instance.requestPermission(
//     announcement: true,
//     carPlay: true,
//     criticalAlert: true,
//   );
// }

// // Future<void> _requestNotificationPermissions() async {
// //   final PermissionStatus status = await Permission.notification.request();
// //   if (status.isGranted) {
// //     // Notification permissions granted
// //   } else if (status.isDenied) {
// //     // Notification permissions denied
// //   } else if (status.isPermanentlyDenied) {
// //     // Notification permissions permanently denied, open app settings
// //     // await openAppSettings();
// //   }
// // }

// Future<void> checkPermissions() async {
//   NotificationSettings settings =
//       await FirebaseMessaging.instance.getNotificationSettings();
// }

// void getToken() async {
//   try {
//     String? token;
//     FirebaseMessaging.instance.getToken().then((String? token) {
//       debugPrint('FCM Token: $token');
//       // save the new token to your server
//       // final notificationStroage = locator<NotificationStroage>();
//       // notificationStroage.saveFCMToken(token);
//     });

//     FirebaseMessaging.instance.onTokenRefresh.listen((String? token) {
//       debugPrint('onTokenRefresh: $token');
//       // save the new token to your server
//       // final notificationStroage = locator<NotificationStroage>();
//       // notificationStroage.saveFCMToken(token);
//     });

//     if (token.isEmptyOrNull) return;
//     debugPrint('token:*****************************************');
//     debugPrint('token: ${token.toString()}');

//     // final notificationStroage = locator<NotificationStroage>();
//     // if (notificationStroage.isFCMTokenExist(token!)) return;

//     // notificationStroage.saveFCMToken(token);
//     // final data = locator<DataService>();
//     // final info = await DeviceInfoPlugin().androidInfo;

//     // /// TODO  type 'Null' is not a subtype of type 'String'
//     // /// https://pub.dev/packages/device_info_plus
//     // final deviceId = info.id;

//     // await data.fcmToken(token, deviceId);
//   } catch (e) {
//     debugPrint('getToken error: $e');
//   }
// }

// void subscribeToTopic([String? topic]) async {
//   await FirebaseMessaging.instance.subscribeToTopic(
//     topic ?? AppConfigs.topic,
//   );
// }

// void unsubscribeFromTopic([String? topic]) async {
//   await FirebaseMessaging.instance.unsubscribeFromTopic(
//     topic ?? AppConfigs.topic,
//   );
// }
