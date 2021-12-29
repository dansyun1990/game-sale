import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/utils/util.dart';
import 'package:game_sale/widgets/email_form_field.dart';

class ForgotPasswordPage extends HookWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).resetPassword),
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
                  padding: const EdgeInsets.only(bottom: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(S.of(context).forgotPasswordMessage),
                ),
                EmailFormField(controller: emailController),
                Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      child: Text(S.of(context).resetPassword),
                      onPressed: () async {
                        showLoaderDialog(context);
                        if (_formKey.currentState!.validate()) {
                          await _resetPassword(
                              context: context, email: emailController.text);
                        }
                        Navigator.pop(context);
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

  Future<void> _resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).sendingSuccess),
          duration: const Duration(seconds: 3),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).userNotFound),
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).sendingFailed),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
