import 'package:flutter/material.dart';
import 'package:game_sale/constants/languages.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/providers/language_selector_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 言語変更ページを作成
class LanguagePage extends HookConsumerWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).languages),
      ),
      body: HookConsumer(
        builder: (context, ref, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: Languages.values.length,
            itemBuilder: (_, index) {
              final locale = Languages.values.elementAt(index);
              return RadioListTile<Languages>(
                value: locale,
                groupValue: ref.watch(languageSelectorProvider),
                onChanged: (newLocale) => ref
                    .watch(languageSelectorProvider.notifier)
                    .change(newLocale!),
                title: Text(Languages.values.elementAt(index).title),
              );
            },
          );
        },
      ),
    );
  }
}
