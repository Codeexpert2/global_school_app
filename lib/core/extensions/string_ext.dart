extension StringExt on String? {
  bool get isEmptyOrNull {
    if (this == null) return true;
    if (this?.isEmpty ?? true) return true;

    return false;
  }

  String get toEmptyString {
    if (this == null) return '';
    if (this?.isEmpty ?? true) return '';

    return this ?? '';
  }

  // bool get isValidPassword {
  //   if (this == null) return false;
  //   return !passwordRegEx.hasMatch(this ?? '');
  // }
}

extension StringExtensions on String {
  bool get hasOnlyWhitespaces => trim().isEmpty && isNotEmpty;

  String toSpaceSeparated() {
    final value = replaceAllMapped(
      RegExp(r'.{4}'),
      (match) => '${match.group(0)} ',
    );
    return value;
  }

  bool get isURLImage => isNotEmpty && (contains('http') || contains('https'));

  Uri? toUri() => Uri.tryParse(this);

  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  String upperCaseFirstChar() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.upperCaseFirstChar())
      .join(' ');

  // bool get isEmail => !emailRegEx.hasMatch(this);

  // String get validateEmail =>
  //     (!emailRegEx.hasMatch(this)) ? 'Enter a valid email' : '';

  // bool get isUserName => !userNameRegEx.hasMatch(this);
  // bool get isCompanyName => !companyNameRegEx.hasMatch(this);
  // bool get isPassword => !passwordRegEx.hasMatch(this);

  // bool get isPhoneNumber => phoneNumberRegExp.hasMatch(this);
}
