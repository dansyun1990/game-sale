import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/pages/account/sign_in_page.dart';
import 'package:game_sale/pages/settings_page.dart';
import 'package:game_sale/providers/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountScreen extends HookConsumerWidget {
  AccountScreen({Key? key}) : super(key: key);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                }
                if (snapshot.hasData) {
                  //ref.read(authProvider.notifier).change(snapshot.data!.uid);
                  // User が null でなない、つまりサインイン済みのホーム画面へ
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: const Image(
                          image: AssetImage('assets/images/avatar.png'),
                          width: 88.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(snapshot.data!.email!),
                      TextButton(
                        onPressed: () async =>
                            await FirebaseAuth.instance.signOut(),
                        child: Text(S.of(context).signOut),
                      ),
                    ],
                  );
                }
                // User が null である、つまり未サインインのサインイン画面へ
                //ref.read(authProvider.notifier).change(null);
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: const Image(
                        image: AssetImage('assets/images/avatar.png'),
                        width: 88.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<bool>(
                            builder: (BuildContext context) => SignInPage()),
                      ),
                      child: Text(S.of(context).signInMessage),
                    ),
                  ],
                );
              },
            ),
            const SettingsPage(),
          ],
        ),
      ),
    );
  }
}
