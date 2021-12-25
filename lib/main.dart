import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_sale/providers/language_selector_provider.dart';
import 'package:game_sale/providers/theme_selector_provider.dart';
import 'package:game_sale/screens/account_screen.dart';
import 'package:game_sale/screens/game_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/languages.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
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
      title: 'Game sale',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeSelectorProvider),
      home: const MyHomePage(),
      locale: Locale(ref.watch(languageSelectorProvider).value),
      localizationsDelegates: const [
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
    final selectIndex = useState(0);
    final page = [GameScreen(), AccountScreen()];

    return Scaffold(
      body: page[selectIndex.value],
      bottomNavigationBar: BottomNavyBar(
        items: [
          BottomNavyBarItem(
            icon: const FaIcon(FontAwesomeIcons.gamepad),
            title: Text(S.of(context).game),
          ),
          BottomNavyBarItem(
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
