import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/pages/account/sign_in_page.dart';

class SignInDialog extends StatelessWidget {
  const SignInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        S.of(context).signInMessage,
        style: const TextStyle(fontSize: 15.0),
      ),
      actions: [
        TextButton(
          child: Text(S.of(context).cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text(S.of(context).signIn),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignInPage()),
            );
          },
        ),
      ],
    );
  }
}
