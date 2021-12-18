import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/validators/email_validator.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: S.of(context).email,
        prefixIcon: const Icon(Icons.email),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return S.of(context).required(S.of(context).email);
        }
        if (!EmailValidator.validate(value)) {
          return S.of(context).invalidEmail;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
