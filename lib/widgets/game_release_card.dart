import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:intl/intl.dart';

import 'card_tag.dart';

/// ゲームリリース用のカードを作成
class GameReleaseCard extends StatelessWidget {
  const GameReleaseCard({
    Key? key,
    required this.coverArt,
    required this.name,
    required this.genre,
    required this.platform,
    this.basePrice,
    required this.releaseDate,
    this.now,
  }) : super(key: key);

  /// ゲームのパッケージ画像url
  final String coverArt;

  /// ゲームの名称
  final String name;

  /// ゲームのジャンル
  final List<String> genre;

  /// ゲームのプラットフォーム
  final String platform;

  /// ゲームの価格
  final int? basePrice;

  /// ゲームのリリース日
  final String releaseDate;

  /// 現在日付
  final DateTime? now;

  @override
  Widget build(BuildContext context) {
    final releaseDateTime = DateTime.tryParse(releaseDate);

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
                  image: CachedNetworkImageProvider(coverArt),
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
                                  name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  genre
                                      .map((genre) => GameGenre.values
                                          .firstWhere((gameGenre) =>
                                              gameGenre.key == genre)
                                          .value)
                                      .toList()
                                      .join(' / '),
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
                          PlatformTag(
                            platform: GamePlatform.values.firstWhere(
                                (gamePlatform) => gamePlatform.key == platform),
                          ),
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
                                    ),
                                  )
                                : CardTag(
                                    text: S.of(context).priceUndecided,
                                    textColor: Colors.blue[600]!,
                                    backgroundColor: Colors.blue[50]!,
                                  ),
                            const Spacer(),
                            releaseDateTime != null
                                ? CardTag(
                                    text: S.of(context).daysSale(releaseDateTime
                                        .difference(now!)
                                        .inDays),
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
