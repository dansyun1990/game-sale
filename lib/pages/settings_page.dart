import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:game_sale/constants/languages.dart';
import 'package:game_sale/extension/theme_mode_extension.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/favorites.dart';
import 'package:game_sale/pages/settings/favorite_page.dart';
import 'package:game_sale/pages/settings/language_page.dart';
import 'package:game_sale/pages/settings/theme_page.dart';
import 'package:game_sale/providers/auth_provider.dart';
import 'package:game_sale/providers/favorites_provider.dart';
import 'package:game_sale/providers/language_selector_provider.dart';
import 'package:game_sale/providers/theme_selector_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定ページを作成
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    Favorites? favorites;

    // サインインした場合のみ、お気に入り一覧を取得
    if (auth.user != null) {
      favorites = ref.watch(favoritesProvider);
    }

    return SettingsList(
      backgroundColor: Theme.of(context).canvasColor,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
              title: S.of(context).favorite,
              subtitle: favorites != null
                  ? S.of(context).numberOfGames +
                      '：' +
                      favorites.favorites.length.toString()
                  : null,
              leading: const Icon(Icons.favorite),
              onPressed: (BuildContext context) async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoritePage(favorites: favorites),
                  ),
                );
              },
            ),
            SettingsTile(
              title: S.of(context).theme,
              subtitle: ref.watch(themeSelectorProvider).title,
              leading: const Icon(Icons.color_lens),
              onPressed: (BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ThemePage()),
                );
              },
            ),
            SettingsTile(
              title: S.of(context).languages,
              subtitle: ref.watch(languageSelectorProvider).title,
              leading: const Icon(Icons.language),
              onPressed: (BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LanguagePage()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
