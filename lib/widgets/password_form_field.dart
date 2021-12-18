import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/password_type.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/validators/password_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordFormField extends HookConsumerWidget {
  const PasswordFormField(
      {Key? key,
      required this.controller,
      this.labelText,
      required this.passwordType,
      this.passwordController})
      : super(key: key);

  final TextEditingController controller;
  final String? labelText;
  final PasswordType passwordType;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            case PasswordType.login:
              return null;
          }
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscure.value,
    );
  }
}
