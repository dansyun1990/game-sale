import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';

import 'account/sign_in_page.dart';

/// アカウントページを作成
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
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
                onPressed: () async => await FirebaseAuth.instance.signOut(),
                child: Text(S.of(context).signOut),
              ),
            ],
          );
        }
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
                MaterialPageRoute(builder: (_) => SignInPage()),
              ),
              child: Text(S.of(context).signInMessage),
            ),
          ],
        );
      },
    );
  }
}
