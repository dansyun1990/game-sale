import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/providers/genre_selector_provider.dart';
import 'package:game_sale/providers/platform_selector_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchFilterPage extends HookConsumerWidget {
  const SearchFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).searchFilter),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).platform,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HookConsumer(builder: (context, ref, child) {
                    return Wrap(
                      spacing: 10.0,
                      children: List<Widget>.generate(
                          GamePlatform.values.length, (index) {
                        final platform = GamePlatform.values[index];
                        final isSelected = ref
                            .watch(platformSelectorProvider)
                            .platformList
                            .contains(platform.key);
                        return FilterChip(
                          label: Text(platform.value),
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          selected: isSelected,
                          selectedColor: Colors.redAccent,
                          checkmarkColor: Colors.white,
                          onSelected: (bool selected) {
                            if (selected) {
                              ref
                                  .watch(platformSelectorProvider.notifier)
                                  .add(platform.key);
                            } else {
                              ref
                                  .watch(platformSelectorProvider.notifier)
                                  .remove(platform.key);
                            }
                          },
                        );
                      }),
                    );
                  }),
                  const SizedBox(height: 16.0),
                  Text(
                    S.of(context).genre,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HookConsumer(builder: (context, ref, child) {
                    return Wrap(
                      spacing: 10.0,
                      children: List<Widget>.generate(GameGenre.values.length,
                          (index) {
                        final genre = GameGenre.values[index];
                        final isSelected = ref
                            .watch(genreSelectorProvider)
                            .genreList
                            .contains(genre.key);
                        return FilterChip(
                          label: Text(genre.value),
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          selected: isSelected,
                          selectedColor: Colors.redAccent,
                          checkmarkColor: Colors.white,
                          onSelected: (bool selected) {
                            if (selected) {
                              ref
                                  .watch(genreSelectorProvider.notifier)
                                  .add(genre.key);
                            } else {
                              ref
                                  .watch(genreSelectorProvider.notifier)
                                  .remove(genre.key);
                            }
                          },
                        );
                      }),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
