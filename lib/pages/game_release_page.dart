import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/release_game.dart';
import 'package:game_sale/providers/release_provider.dart';
import 'package:game_sale/widgets/game_release_card.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

/// ゲームリリースページを作成
class GameReleasePage extends HookConsumerWidget {
  const GameReleasePage({
    Key? key,
    required this.pageController,
    required this.tabController,
    required this.platform,
  }) : super(key: key);

  /// ゲームプラットフォーム別表示用のページコントローラ
  final PageController pageController;

  /// ゲームプラットフォーム別表示用のタブコントローラ
  final TabController tabController;

  /// ゲームプラットフォーム
  final GamePlatform platform;

  /// スクロールで遅延読み込みの基準値
  static const _threshold = 0.8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final releaseGames = ref.watch(releaseProvider(platform));

    return NotificationListener<ScrollEndNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        final scrollProportion =
            scrollInfo.metrics.pixels / scrollInfo.metrics.maxScrollExtent;
        // 画面の80%にスクロールした場合、遅延読み込み
        if (!releaseGames.isLoading && scrollProportion > _threshold) {
          ref
              .watch(releaseProvider(platform).notifier)
              .fetchPosts(platform.key);
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async => await ref.refresh(releaseProvider(platform)),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  onTap: (value) {
                    pageController.jumpToPage(value);
                  },
                  controller: tabController,
                  tabs: GamePlatform.values
                      .map((gamePlatform) => Tab(text: gamePlatform.value))
                      .toList(),
                  labelStyle: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                  isScrollable: false,
                  indicator: const BoxDecoration(),
                  unselectedLabelColor: Colors.grey[400],
                  labelColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              pinned: true,
            ),
            HookConsumer(builder: (context, ref, child) {
              final state = releaseGames;
              return SliverGroupedListView<ReleaseGame, String>(
                elements: state.releaseGames,
                groupBy: (releaseGame) {
                  final releaseDate =
                      DateTime.tryParse(releaseGame.releaseDate);
                  return releaseDate == null
                      ? S.of(context).comingSoon
                      : DateFormat.yMMM().format(releaseDate);
                },
                groupSeparatorBuilder: (groupByValue) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupByValue,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                indexedItemBuilder: (context, releaseGame, index) {
                  final releaseDate =
                      DateTime.tryParse(releaseGame.releaseDate);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index == 0 ||
                              state.releaseGames[index].releaseDate !=
                                  state
                                      .releaseGames[
                                          index - 1 < 0 ? index : index - 1]
                                      .releaseDate
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                releaseDate == null
                                    ? S.of(context).releaseUndecided
                                    : DateFormat.MMMd().format(releaseDate),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : Container(),
                      GameReleaseCard(
                        coverArt: releaseGame.coverArt,
                        name: releaseGame.name,
                        genre: releaseGame.genre,
                        platform: releaseGame.platform,
                        basePrice: releaseGame.basePrice,
                        releaseDate: releaseGame.releaseDate,
                        now: DateTime.now(),
                      ),
                    ],
                  );
                },
                itemComparator: (item1, item2) =>
                    item1.releaseDate.compareTo(item2.releaseDate),
                // optional
                order: GroupedListOrder.ASC, // optional
              );
            }),
          ],
        ),
      ),
    );
  }
}

/// プラットフォーム切替用タブバーのデリゲートを作成
class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  StickyTabBarDelegate({required this.child});

  final TabBar child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
