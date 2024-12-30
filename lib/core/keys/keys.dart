import 'dart:io';

import 'package:flutter/material.dart';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

const String tokenKey = 'token';
const String themeKey = 'themeKey';
const String notificationKey = 'notificationKey';
const String languageCodeKey = 'languageCodeKey';
const String fcmTokenKey = 'fcmTokenKey';
const String onboardingKey = 'onboardingKey';
const String localUserKey = 'localUserKey';
const String favoriteCoursesKey = 'favoriteCoursesKey';
