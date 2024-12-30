import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'package:global_school/services/file_services/file_service.dart';
import 'package:global_school/services/local_storage/secure_storage_service.dart';
import 'package:global_school/services/local_storage/storage_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

GetIt locator = GetIt.instance;

Future<void> initializeApp() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Allow reassignment of values in the locator
  locator.allowReassignment = true;

  locator.registerSingleton<FileService>(FileService());

  await locator.get<FileService>().init();

  /* 
  /// Initilize Hive Database
  await Hive.initFlutter();
  /// Register Adapater Which we have generated Class Name Like Model Class name+Adapter
  Hive.registerAdapter(TodoAdapter());

  /// Give  Database Name anything you want, here todos is My database Name
  await Hive.openBox<Todo>('todos'); */

  // Initialize GetStorage for local storage
  final storage = GetStorage(
    'AppStorage',
    locator<FileService>().supportPath,
  );

  await storage.initStorage;

  // Register GetStorage as a singleton in the service locator
  locator.registerSingleton<GetStorage>(storage);

  // Register StorageService as a lazy singleton in the service locator
  // The StorageService depends on the GetStorage instance
  locator.registerLazySingleton<StorageService>(
    () => StorageService(storage),
  );

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  /// Initializes the FlutterSecureStorage instance and registers the
  /// SecureStorageService as a lazy singleton in the service locator.
  ///
  /// The SecureStorageService depends on the FlutterSecureStorage instance.
  ///
  /// Example usage:
  ///
  /// ```dart
  ///   final secureStorageService = locator<SecureStorageService>();
  ///
  ///   secureStorageService.write(key: 'exampleKey', value: 'exampleValue');
  /// }
  /// ```
  locator.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(secureStorage),
  );

  /// Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // // Set the background messaging handler early on, as a named top-level function
  // FirebaseMessaging.onBackgroundMessage(
  //   firebaseMessagingBackgroundHandler,
  // );

  // await setupFlutterNotifications();

  // Set status bar and navigation bar appearance
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      // statusBarColor: AppColor.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize any dependency injection
  // await setupDependencyInjection();
}
