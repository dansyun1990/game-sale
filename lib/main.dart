import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_sale/providers/language_selector_provider.dart';
import 'package:game_sale/providers/theme_selector_provider.dart';
import 'package:game_sale/screens/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/languages.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

/// アプリのエントリーポイント
/// Firebase、Riverpod有効化などアプリ全般の設定を行う
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Game sale',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeSelectorProvider),
      home: const Home(),
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
