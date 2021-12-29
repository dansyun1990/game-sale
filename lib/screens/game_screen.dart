import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/pages/game/game_search_delegate.dart';
import 'package:game_sale/pages/game_release_page.dart';
import 'package:game_sale/pages/game_sale_page.dart';

/// ゲーム画面を作成
class GameScreen extends HookWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameTabController = useTabController(initialLength: 2);
    final releaseTabController = useTabController(initialLength: 5);
    final releasePageController = usePageController();

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              sliver: SliverAppBar(
                toolbarHeight: 80.0,
                title: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: GameSearchDelegate(),
                      );
                    },
                    child: const TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      ),
                    ),
                  ),
                ),
                floating: true,
                pinned: true,
                snap: false,
                primary: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  controller: gameTabController,
                  tabs: [
                    Tab(text: S.of(context).deals),
                    Tab(text: S.of(context).release)
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: gameTabController,
        children: [
          const GameSalePage(),
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: releasePageController,
            children: List<Widget>.generate(
              GamePlatform.values.length,
              (index) {
                return GameReleasePage(
                  tabController: releaseTabController,
                  pageController: releasePageController,
                  platform: GamePlatform.values.elementAt(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
