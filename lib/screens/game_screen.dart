import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/models/user.dart';
import 'package:game_sale/pages/game/game_detail_page.dart';
import 'package:game_sale/pages/game/game_release_page.dart';
import 'package:game_sale/pages/game/game_search_delegate.dart';
import 'package:game_sale/pages/game/search_filter_page.dart';
import 'package:game_sale/widgets/game_sale_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  Future getPost() async {
    var firestore = FirebaseFirestore.instance;

    var query = await firestore.collection('games').get();

    return query.docs;
  }

  Future<List<User>> usersStream() {
    final snapshots = FirebaseFirestore.instance.collection('test')
        .withConverter<User>(
      fromFirestore: (snapshot, _) => User.fromDocumentSnapshot(snapshot),
      toFirestore: (obj, _) => obj.toJson(),
    ).get();
    final result = snapshots.then((qs) => qs.docs.map((qds) => qds.data()).toList());
    return result;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    CollectionReference games = FirebaseFirestore.instance.collection('games');

    final releaseList = [
      {
        'image': 'assets/images/elden.webp',
        'title': 'ELDEN RING',
        'genre': ['ACT', 'RPG'],
        'platform': 1,
        'basePrice': 9240,
        'releaseDate': '2022-02-25'
      },
      {
        'image': 'assets/images/elden.webp',
        'title': 'ELDEN RING',
        'genre': ['ACT', 'RPG'],
        'platform': 0,
        'basePrice': 9240,
        'releaseDate': '2022-02-25'
      },
      {
        'image': 'assets/images/gt7.webp',
        'title': 'グランツーリスモ７',
        'genre': ['RCG'],
        'platform': 1,
        'basePrice': 8690,
        'releaseDate': '2022-03-04'
      },
      {
        'image': 'assets/images/gt7.webp',
        'title': 'グランツーリスモ７',
        'genre': ['RCG'],
        'platform': 0,
        'basePrice': 8690,
        'releaseDate': '2022-03-04'
      },
      {
        'image': 'assets/images/horizon.webp',
        'title': 'Horizon Forbidden West',
        'genre': ['ACT', 'RPG'],
        'platform': 1,
        'basePrice': 8690,
        'releaseDate': '2022-02-18'
      },
      {
        'image': 'assets/images/horizon.webp',
        'title': 'Horizon Forbidden West',
        'genre': ['ACT', 'RPG'],
        'platform': 0,
        'basePrice': 8690,
        'releaseDate': '2022-02-18'
      },
      {
        'image': 'assets/images/rainbow.webp',
        'title': 'レインボーシックス シージ',
        'genre': ['ACT'],
        'platform': 1,
        'basePrice': null,
        'releaseDate': '2022-04-21'
      },
      {
        'image': 'assets/images/rainbow.webp',
        'title': 'レインボーシックス シージ',
        'genre': ['ACT'],
        'platform': 2,
        'basePrice': 3960,
        'releaseDate': null
      },
      {
        'image': 'assets/images/rainbow.webp',
        'title': 'レインボーシックス シージ',
        'genre': ['ACT'],
        'platform': 3,
        'basePrice': null,
        'releaseDate': null
      }
    ];

    final releaseList2 = [
      {
        'image': 'assets/images/elden.webp',
        'title': 'ELDEN RING',
        'genre': ['ACT', 'RPG'],
        'platform': 0,
        'basePrice': 9240,
        'releaseDate': '2022-02-25'
      },
      {
        'image': 'assets/images/gt7.webp',
        'title': 'グランツーリスモ７',
        'genre': ['RCG'],
        'platform': 0,
        'basePrice': 8690,
        'releaseDate': '2022-03-04'
      },
      {
        'image': 'assets/images/horizon.webp',
        'title': 'Horizon Forbidden West',
        'genre': ['ACT', 'RPG'],
        'platform': 0,
        'basePrice': 8690,
        'releaseDate': '2022-02-18'
      },
    ];

    final releaseList3 = [
      {
        'image': 'assets/images/elden.webp',
        'title': 'ELDEN RING',
        'genre': ['ACT', 'RPG'],
        'platform': 1,
        'basePrice': 9240,
        'releaseDate': '2022-02-25'
      },
      {
        'image': 'assets/images/gt7.webp',
        'title': 'グランツーリスモ７',
        'genre': ['RCG'],
        'platform': 1,
        'basePrice': 8690,
        'releaseDate': '2022-03-04'
      },
      {
        'image': 'assets/images/horizon.webp',
        'title': 'Horizon Forbidden West',
        'genre': ['ACT', 'RPG'],
        'platform': 1,
        'basePrice': 8690,
        'releaseDate': '2022-02-18'
      },
    ];

    final releaseList4 = [
      {
        'image': 'assets/images/rainbow.webp',
        'title': 'レインボーシックス シージ',
        'genre': ['ACT'],
        'platform': 2,
        'basePrice': 3960,
        'releaseDate': null
      },
    ];

    final releaseList5 = [
      {
        'image': 'assets/images/rainbow.webp',
        'title': 'レインボーシックス シージ',
        'genre': ['ACT'],
        'platform': 3,
        'basePrice': null,
        'releaseDate': null
      }
    ];

    var tabController2 = useTabController(initialLength: 5);
    var tabController = useTabController(initialLength: 2);
    var pageController = usePageController();

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            // This widget takes the overlapping behavior of the SliverAppBar,
            // and redirects it to the SliverOverlapInjector below. If it is
            // missing, then it is possible for the nested "inner" scroll view
            // below to end up under the SliverAppBar even when the inner
            // scroll view thinks it has not been scrolled.
            // This is not necessary if the "headerSliverBuilder" only builds
            // widgets that do not overlap the next sliver.
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
                          context: context, delegate: GameSearchDelegate());
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
                actions: [
                  IconButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute<bool>(
                              builder: (BuildContext context) =>
                                  SearchFilterPage()))
                    },
                    icon: const Icon(Icons.filter_alt),
                  )
                ],
                floating: true,
                pinned: true,
                snap: false,
                primary: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(
                      text: 'セール情報',
                    ),
                    Tab(
                      text: '発売予定',
                    )
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          FutureBuilder<List<User>>(
              future: usersStream(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text('text'),
                  );
                } else {
                  final querySnapshot = snapshot.requireData;
                  return ListView.builder(
                    itemCount: querySnapshot.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<bool>(
                              builder: (BuildContext context) =>
                                  GameDetailPage()),
                        );
                      },
                      child: GameSaleCard(
                        key: UniqueKey(),
                        packageImage: 'assets/images/rainbow.webp',
                        title: querySnapshot[index].name,
                        genre: GameGenre.values
                            .firstWhere((gameGenre) => gameGenre.key == 'FPS')
                            .value,
                        platform: GamePlatform.values.firstWhere(
                            (gamePlatform) => gamePlatform.key == 0),
                        basePrice: 3960,
                        salePrice: 1188,
                        discountPercent: 70,
                        discountedUntil: DateTime(2022, 1, 10, 23, 0),
                        now: DateTime.now(),
                      ),
                    ),
                  );
                }
              }),
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              GameReleasePage(
                tabController: tabController2,
                pageController: pageController,
                releaseList: releaseList,
              ),
              GameReleasePage(
                tabController: tabController2,
                pageController: pageController,
                releaseList: releaseList2,
              ),
              GameReleasePage(
                tabController: tabController2,
                pageController: pageController,
                releaseList: releaseList3,
              ),
              GameReleasePage(
                tabController: tabController2,
                pageController: pageController,
                releaseList: releaseList4,
              ),
              GameReleasePage(
                tabController: tabController2,
                pageController: pageController,
                releaseList: releaseList5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
