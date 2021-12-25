import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'card_tag.dart';

class GameReleaseCard extends HookConsumerWidget {
  const GameReleaseCard(
      {Key? key,
      required this.packageImage,
      required this.title,
      required this.genre,
      required this.platform,
      this.basePrice,
      this.releaseDate,
      this.now})
      : super(key: key);

  final String packageImage;
  final String title;
  final String genre;
  final GamePlatform platform;
  final int? basePrice;
  final DateTime? releaseDate;
  final DateTime? now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Card(
        elevation: 0.0,
        child: SizedBox(
          height: 110.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image(
                  width: 110.0,
                  image: AssetImage(packageImage),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 4.0, 3.0, 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  genre,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PlatformTag(platform: platform),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            basePrice != null
                                ? Expanded(
                                    child: Text(
                                    NumberFormat.simpleCurrency(locale: 'ja')
                                        .format(basePrice),
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ))
                                : CardTag(
                                    text: S.of(context).priceUndecided,
                                    textColor: Colors.blue[600]!,
                                    backgroundColor: Colors.blue[50]!,
                                  ),
                            const Spacer(),
                            releaseDate != null
                                ? CardTag(
                                    text: S.of(context).daysSale(
                                        releaseDate!.difference(now!).inDays),
                                    textColor: Colors.red[600]!,
                                    backgroundColor: Colors.red[50]!,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
