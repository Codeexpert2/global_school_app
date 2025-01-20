class AppConfigs {

  //http://10.0.2.2:8000/api
  static const String appName = 'App Name';
  static const String baseDomin = 'http://10.0.2.2:8000';
  static const String baseUrl = 'http://masplatform.online';
  static const String baseApiUrl = '$baseUrl/api';
  static const String topic = 'general';
  static const Duration period = Duration(seconds: 1);
  static const int perPage = 10;
  // Terms of Service link
  static const String termsOfServiceUrl =
      'https://your-terms-of-service-url.com';
  // Privacy Policy link
  static const String privacyPolicyUrl = 'https://your-privacy-policy-url.com';

  // font family
  static const String fontFamily = 'Cairo';
  static const defaultLocale = 'ar';
  static final supportedLocales = [
    {'locale': 'ar', 'name': 'عربي', 'icon': '🇵🇸'},
    {'locale': 'en', 'name': 'English', 'icon': '🇺🇸'},
  ];

  // static List<String> pagesWithoutNavBar = [
  //   // AppRoutes.courses.path,
  //   // AppRoutes.consultations.path,
  //   AppRoutes.courseDetail.name,
  //   AppRoutes.lesson.name,
  // ];

  // Define your Arabic countries
  static const List<String> arabicCountries = [
    'SA', // Saudi Arabia
    'AE', // United Arab Emirates
    'JO', // Jordan
    'KW', // Kuwait
    'OM', // Oman
    'QA', // Qatar
    'BH', // Bahrain
    'LB', // Lebanon
    'EG', // Egypt
    'PS', // Palestine
    'AE', // United Arab Emirates
    'SY', // Syria
    'YE', // Yemen
    // Add more countries as needed
  ];
}
