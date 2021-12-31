import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/pages/account/sign_in_page.dart';

/// サインイン用のテキストボタンを作成
class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SignInPage()),
      ),
      child: Text(S.of(context).signInMessage),
    );
  }
}
