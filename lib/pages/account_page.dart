import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/providers/auth_provider.dart';
import 'package:game_sale/utils/util.dart';
import 'package:game_sale/widgets/sign_in_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アカウントページを作成
class AccountPage extends HookConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          final userName = ref.read(userNameProvider);
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
              Text(userName ?? snapshot.data!.displayName!),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  showMessageSnackBar(context, S.of(context).signOutSuccess);
                },
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
            const SignInButton(),
          ],
        );
      },
    );
  }
}
