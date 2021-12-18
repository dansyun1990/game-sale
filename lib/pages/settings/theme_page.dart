import 'package:flutter/material.dart';
import 'package:game_sale/extension/theme_mode_extension.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/providers/theme_selector_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemePage extends HookConsumerWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).theme),
      ),
      body: HookConsumer(
        builder: (context, ref, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: ThemeMode.values.length,
            itemBuilder: (_, index) {
              final themeMode = ThemeMode.values[index];
              return RadioListTile<ThemeMode>(
                value: themeMode,
                groupValue: ref.watch(themeSelectorProvider),
                title: Text(themeMode.title),
                subtitle: Text(themeMode.subTitle),
                onChanged: (newTheme) {
                  ref.watch(themeSelectorProvider.notifier).change(newTheme!);
                },
              );
            },
          );
        },
      ),
    );
  }
}
