import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/password_type.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/utils/util.dart';
import 'package:game_sale/widgets/email_form_field.dart';
import 'package:game_sale/widgets/password_form_field.dart';

/// サインアップページを作成
class RegisterPage extends HookWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).signUp),
      ),
      body: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmailFormField(controller: emailController),
                const SizedBox(height: 16.0),
                PasswordFormField(
                  controller: passwordController,
                  labelText: S.of(context).password,
                  passwordType: PasswordType.register,
                ),
                const SizedBox(height: 16.0),
                PasswordFormField(
                  controller: confirmPasswordController,
                  labelText: S.of(context).confirmPassword,
                  passwordType: PasswordType.confirm,
                  passwordController: passwordController,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(S.of(context).passwordPolicy),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      child: Text(S.of(context).signUp),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          showLoaderDialog(context);
                          await _signUp(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                          );
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

  Future<void> _signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'userName': 'userName',
        'email': email,
        'createdAt': Timestamp.now(),
      });
      var count = 0;
      Navigator.popUntil(context, (_) => count++ >= 2);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).emailAlreadyInUse),
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).createUserFailed),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
