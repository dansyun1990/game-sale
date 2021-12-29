import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/password_type.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/validators/password_validator.dart';

/// パスワード用のフィールドを作成
class PasswordFormField extends HookWidget {
  const PasswordFormField(
      {Key? key,
      required this.controller,
      this.labelText,
      required this.passwordType,
      this.passwordController})
      : super(key: key);

  /// パスワード用のコントローラ
  final TextEditingController controller;

  /// 入力フィールドの名称
  final String? labelText;

  /// パスワードのタイプ
  final PasswordType passwordType;

  /// パスワード確認用のコントローラ
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    final obscure = useState(true);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        suffixIcon: IconButton(
          icon: Icon(
            obscure.value ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => obscure.value = !obscure.value,
        ),
        prefixIcon: const Icon(Icons.lock),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return S.of(context).required(S.of(context).confirmPassword);
        } else {
          // パスワードのタイプにより、異なる入力チェックを行う
          switch (passwordType) {
            case PasswordType.register:
              if (!PasswordValidator.validateUppercase(value)) {
                return S.of(context).passwordUppercase;
              }
              if (!PasswordValidator.validateLowercase(value)) {
                return S.of(context).passwordLowercase;
              }
              if (!PasswordValidator.validateDigit(value)) {
                return S.of(context).passwordDigit;
              }
              if (!PasswordValidator.validateSpecialCharacter(value)) {
                return S.of(context).passwordSpecialCharacter;
              }
              if (!PasswordValidator.validateLength(value)) {
                return S.of(context).passwordLength;
              }
              return null;
            case PasswordType.confirm:
              if (value != passwordController?.text) {
                return S.of(context).passwordMismatch;
              }
              return null;
            case PasswordType.signIn:
              return null;
          }
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscure.value,
    );
  }
}
