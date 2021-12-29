import 'package:flutter/material.dart';
import 'package:game_sale/pages/game/search_filter_page.dart';
import 'package:game_sale/providers/filter_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームセールフィルター用のボタンを作成
class FilterButton extends HookConsumerWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SearchFilterPage(),
          ),
        )
      },
      icon: ref.watch(genreSelectorProvider).filters.isNotEmpty ||
              ref.watch(platformSelectorProvider).filters.isNotEmpty
          ? const Icon(Icons.filter_alt)
          : const Icon(Icons.filter_alt_outlined),
    );
  }
}
