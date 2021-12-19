import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/pages/game/search_filter_page.dart';
import 'package:game_sale/providers/language_selector_provider.dart';
import 'package:game_sale/providers/theme_selector_provider.dart';
import 'package:game_sale/screens/account_screen.dart';
import 'package:game_sale/widgets/game_sale_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/languages.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeSelectorProvider),
      home: const MyHomePage(),
      locale: Locale(ref.watch(languageSelectorProvider).value),
      localizationsDelegates: [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CollectionReference _firebaseFirestore =
        FirebaseFirestore.instance.collection('games');

    final selectIndex = useState(0);
    var tabController = useTabController(initialLength: 2);
    var page = [
      TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => GameSaleCard(
                packageImage: 'assets/images/test.webp',
                title: 'レインボーシックス シージ',
                genre: GameGenre.values
                    .firstWhere((gameGenre) => gameGenre.key == 'FPS')
                    .value,
                platform: GamePlatform.values
                    .firstWhere((gamePlatform) => gamePlatform.key == 0)
                    .value,
                basePrice: 3960,
                salePrice: 1188,
                discountPercent: 70,
                discountedUntil: DateTime(2022, 1, 10, 23, 0),
                now: DateTime.now()),
          ),
          Text('test'),
        ],
      ),
      AccountScreen()
    ];

    return Scaffold(
      appBar: selectIndex.value == 0
          ? AppBar(
              toolbarHeight: 80.0,
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
              bottom: selectIndex.value == 0
                  ? TabBar(
                      controller: tabController,
                      tabs: [
                        Tab(
                          text: 'セール情報',
                        ),
                        Tab(
                          text: 'リリース',
                        )
                      ],
                    )
                  : null,
            )
          : null,
      body: Center(
        child: page[selectIndex.value],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: 'ゲーム'),
          TabItem(icon: Icons.account_circle, title: 'アカウント'),
        ],
        initialActiveIndex: selectIndex.value,
        onTap: (index) {
          selectIndex.value = index;
        },
      ),
    );
  }
}
