import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_sort.dart';
import 'package:game_sale/providers/sort_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームセールソート用のボタンを作成
class SortButton extends HookConsumerWidget {
  const SortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<GameSort>(
      icon: const Icon(Icons.sort),
      onSelected: (value) =>
          ref.watch(sortSelectorProvider.notifier).state = value,
      itemBuilder: (_) => List<PopupMenuEntry<GameSort>>.generate(
          GameSort.values.length, (index) {
        final sort = GameSort.values.elementAt(index);
        return CheckedPopupMenuItem(
          padding: EdgeInsets.zero,
          checked: sort == ref.watch(sortSelectorProvider.state).state,
          value: sort,
          child: Row(
            children: [
              Text(
                sort.value,
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: sort.icon,
              ),
            ],
          ),
        );
      }),
    );
  }
}
