import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_sale/generated/l10n.dart';

import 'account_screen.dart';
import 'game_screen.dart';

/// ホームを作成
class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectIndex = useState(0);
    final page = [const GameScreen(), const AccountScreen()];

    return Scaffold(
      body: page[selectIndex.value],
      bottomNavigationBar: BottomNavyBar(
        items: [
          BottomNavyBarItem(
            activeColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Colors.white,
            inactiveColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Colors.white,
            icon: const FaIcon(FontAwesomeIcons.gamepad),
            title: Text(S.of(context).game),
          ),
          BottomNavyBarItem(
            activeColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Colors.white,
            inactiveColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Colors.white,
            icon: const FaIcon(FontAwesomeIcons.userCog),
            title: Text(S.of(context).account),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        selectedIndex: selectIndex.value,
        onItemSelected: (index) {
          selectIndex.value = index;
        },
      ),
    );
  }
}
