import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:game_sale/constants/languages.dart';
import 'package:game_sale/extension/theme_mode_extension.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/pages/settings/language_page.dart';
import 'package:game_sale/pages/settings/theme_page.dart';
import 'package:game_sale/providers/language_selector_provider.dart';
import 'package:game_sale/providers/theme_selector_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsList(
      shrinkWrap: true,
      sections: [
        SettingsSection(
          title: S.of(context).settings,
          tiles: [
            SettingsTile(
              title: S.of(context).theme,
              subtitle: ref.watch(themeSelectorProvider).title,
              leading: const Icon(Icons.color_lens),
              onPressed: (BuildContext context) {
                Navigator.push(
                    context,
                    MaterialPageRoute<bool>(
                        builder: (BuildContext context) => const ThemePage()));
              },
            ),
            SettingsTile(
              title: S.of(context).language,
              subtitle: ref.watch(languageSelectorProvider).title,
              leading: const Icon(Icons.language),
              onPressed: (BuildContext context) {
                Navigator.push(
                    context,
                    MaterialPageRoute<bool>(
                        builder: (BuildContext context) =>
                            const LanguagePage()));
              },
            ),
          ],
        ),
      ],
    );
  }
}
