class AppRegex {
  static final RegExp emailRegEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp numRegEx = RegExp(r'.*[0-9].*');
  static final RegExp letterRegEx = RegExp(r'.*[A-Za-z].*');
  static final RegExp lowercaseregEx = RegExp(r'.*[a-z].*');
  static final RegExp uppercaseRegEx = RegExp(r'.*[A-Z].*');
  static final RegExp nonAlphanumericRegEx = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  static final RegExp phoneNumberRegEx = RegExp(r'^\+?[1-9]\d{1,14}$');
  // static final RegExp userNameRegEx = RegExp(r'^(?=.*[a-z])[A-Za-z ]{2,}$');

  static final RegExp userNameRegEx = RegExp(
      r'^(?=.*[a-zA-Z\u00C0-\u024F\u0600-\u06FF])[A-Za-z\u00C0-\u024F\u0600-\u06FF ]{2,}$');
  static final passwordRegEx = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');
}
