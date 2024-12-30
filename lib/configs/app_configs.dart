class AppConfigs {
  static const String appName = 'App Name';
  static const String baseDomin = 'https://jsonplaceholder.typicode.com';
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/todos';
  static const String topic = 'general';
  static const Duration period = Duration(seconds: 1);
  static const int perPage = 10;
  // Terms of Service link
  static const String termsOfServiceUrl =
      'https://your-terms-of-service-url.com';
  // Privacy Policy link
  static const String privacyPolicyUrl = 'https://your-privacy-policy-url.com';

  // font family
  static const String fontFamily = 'Poppins';
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
