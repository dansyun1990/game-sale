import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/password_type.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/pages/account/forgot_password_page.dart';
import 'package:game_sale/pages/account/register_page.dart';
import 'package:game_sale/utils/util.dart';
import 'package:game_sale/widgets/email_form_field.dart';
import 'package:game_sale/widgets/password_form_field.dart';

class SignInPage extends HookWidget {
  SignInPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).signIn),
      ),
      body: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(S.of(context).accountConfirm),
                      TextButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute<bool>(
                              builder: (BuildContext context) => RegisterPage(),
                            ),
                          )
                        },
                        child: Text(
                          S.of(context).signUp,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                EmailFormField(controller: emailController),
                const SizedBox(height: 16.0),
                PasswordFormField(
                  controller: passwordController,
                  labelText: S.of(context).confirmPassword,
                  passwordType: PasswordType.signIn,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute<bool>(
                          builder: (BuildContext context) =>
                              ForgotPasswordPage(),
                        ),
                      )
                    },
                    child: Text(
                      S.of(context).forgotPassword,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      child: Text(S.of(context).signIn),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          showLoaderDialog(context);
                          await _signIn(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).authenticationFailed),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
