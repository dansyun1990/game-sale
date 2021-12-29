import 'package:flutter/material.dart';
import 'package:game_sale/pages/account_page.dart';
import 'package:game_sale/pages/settings_page.dart';

/// アカウント設定画面を作成
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 16.0),
            AccountPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
