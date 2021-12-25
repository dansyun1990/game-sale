import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/widgets/game_release_card.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class GameReleasePage extends HookConsumerWidget {
  const GameReleasePage(
      {Key? key,
      required this.pageController,
      required this.tabController,
      required this.releaseList})
      : super(key: key);

  final PageController pageController;
  final TabController tabController;
  final List<Map<String, Object?>> releaseList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final releaseFilter = ['全部', 'PS4', 'PS5', 'Switch', 'Steam'];

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: StickyTabBarDelegate(
            child: TabBar(
              onTap: (value) {
                pageController.jumpToPage(value);
              },
              controller: tabController,
              tabs: releaseFilter.map((e) => Tab(text: e)).toList(),
              labelStyle:
                  const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
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
        SliverGroupedListView<dynamic, String>(
          elements: releaseList,
          groupBy: (element) => element['releaseDate'] == null
              ? S.of(context).comingSoon
              : DateFormat.yMMM()
                  .format(DateTime.parse(element['releaseDate'])),
          groupSeparatorBuilder: (String groupByValue) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  groupByValue,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          indexedItemBuilder: (context, dynamic element, int index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ||
                      releaseList[index]['releaseDate'] !=
                          releaseList[index - 1 < 0 ? index : index - 1]
                              ['releaseDate']
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        element['releaseDate'] == null
                            ? S.of(context).releaseUndecided
                            : DateFormat.MMMd()
                                .format(DateTime.parse(element['releaseDate'])),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : Container(),
              GameReleaseCard(
                packageImage: element['image'],
                title: element['title'],
                genre: element['genre']
                    .map((genre) => GameGenre.values
                        .firstWhere((gameGenre) => gameGenre.key == genre)
                        .value)
                    .toList()
                    .join('/'),
                platform: GamePlatform.values.firstWhere(
                    (gamePlatform) => gamePlatform.key == element['platform']),
                basePrice: element['basePrice'],
                releaseDate: element['releaseDate'] == null
                    ? null
                    : DateTime.parse(element['releaseDate']),
                now: DateTime.now(),
              ),
            ],
          ),
          itemComparator: (item1, item2) =>
              item1['releaseDate']?.compareTo(item2['releaseDate']) ?? 0,
          // optional
          order: GroupedListOrder.ASC, // optional
        ),
      ],
    );
  }
}

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
