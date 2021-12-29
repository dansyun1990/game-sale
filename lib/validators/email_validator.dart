/// eメール入力チェック用バリデータ
class EmailValidator {
  /// eメールの形式チェック
  static bool validate(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }
}
