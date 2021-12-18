class PasswordValidator {
  static bool validateUppercase(String value) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(value);
  }

  static bool validateLowercase(String value) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(value);
  }

  static bool validateDigit(String value) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(value);
  }

  static bool validateSpecialCharacter(String value) {
    return RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value);
  }

  static bool validateLength(String value) {
    return RegExp(r'^.{8,}$').hasMatch(value);
  }
}
