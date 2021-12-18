import 'package:flutter/material.dart';
import 'package:game_sale/pages/account/login_page.dart';
import 'package:game_sale/pages/settings_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountScreen extends HookConsumerWidget {
  AccountScreen({Key? key}) : super(key: key);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage('assets/images/avatar.png'),
            ),
            Text('ログインしてくだい。'),
            ElevatedButton(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute<bool>(builder: (BuildContext context) => LoginPage())),
                child: Text('test'))
          ],
        ),
        SettingsPage(),
      ],
    ));
  }
}
