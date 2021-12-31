import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/providers/navigation_selector_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'account_screen.dart';
import 'game_screen.dart';

/// ホームを作成
class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectIndex = ref.watch(navigationSelectorProvider);
    final page = [const GameScreen(), const AccountScreen()];

    return Scaffold(
      body: page[selectIndex],
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
        selectedIndex: selectIndex,
        onItemSelected: (index) {
          ref.watch(navigationSelectorProvider.notifier).state = index;
        },
      ),
    );
  }
}
