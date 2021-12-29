/// パスワード入力チェック用バリデータ
class PasswordValidator {
  /// 1つの英大文字を含むチェック
  static bool validateUppercase(String value) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(value);
  }

  /// 1つの英小文字を含むチェック
  static bool validateLowercase(String value) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(value);
  }

  /// 1つの数字を含むチェック
  static bool validateDigit(String value) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(value);
  }

  /// 1つの記号を含むチェック
  static bool validateSpecialCharacter(String value) {
    return RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value);
  }

  /// 長さは8文字以上チェック
  static bool validateLength(String value) {
    return RegExp(r'^.{8,}$').hasMatch(value);
  }
}
