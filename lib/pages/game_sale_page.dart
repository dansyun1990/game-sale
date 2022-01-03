import 'package:flutter/material.dart';
import 'package:game_sale/providers/filter_provider.dart';
import 'package:game_sale/providers/games_provider.dart';
import 'package:game_sale/providers/sort_provider.dart';
import 'package:game_sale/widgets/filter_button.dart';
import 'package:game_sale/widgets/game_sale_card.dart';
import 'package:game_sale/widgets/sort_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームセールページを作成
class GameSalePage extends HookConsumerWidget {
  const GameSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesState = ref.watch(gamesProvider);

    return NotificationListener<ScrollEndNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        // 画面一番したまでスクロールした場合、遅延読み込み
        if (!gamesState.isLoading &&
            scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          ref.read(gamesProvider.notifier).fetchPosts(
              sort: ref.read(sortSelectorProvider),
              platforms: ref.read(platformSelectorProvider).filters,
              genres: ref.read(genreSelectorProvider).filters);
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async => await ref.refresh(gamesProvider),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: StickyBarDelegate(
                child: Center(
                  child: Row(
                    children: const [
                      SortButton(),
                      Spacer(),
                      FilterButton(),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final games = gamesState.games;
                  if (index < games.length) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      child: GameSaleCard(
                        key: UniqueKey(),
                        game: games.elementAt(index),
                      ),
                    );
                  } else if (gamesState.hasMore) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return Container();
                  }
                },
                childCount: gamesState.games.length + 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 固定ヘッダ用のデリゲートを作成
class StickyBarDelegate extends SliverPersistentHeaderDelegate {
  StickyBarDelegate({required this.child});

  final Center child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 48.0;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
