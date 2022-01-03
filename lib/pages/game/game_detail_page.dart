import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/widgets/detail_lable.dart';
import 'package:intl/intl.dart';

/// ゲーム詳細ページを作成
class GameDetailPage extends StatelessWidget {
  const GameDetailPage({
    Key? key,
    required this.name,
    required this.developer,
    required this.publisher,
    required this.releaseDate,
    required this.genre,
    required this.platform,
    required this.voice,
    required this.languages,
    required this.desc,
  }) : super(key: key);

  /// ゲームの名称
  final String name;

  /// ゲームの開発元
  final String developer;

  /// ゲームの発売元
  final String publisher;

  /// ゲームのリリース日
  final String releaseDate;

  /// ゲームのジャンル
  final List<String> genre;

  /// ゲームのプラットフォーム
  final String platform;

  /// ゲームの音声
  final List<String> voice;

  /// ゲームの言語
  final List<String> languages;

  /// ゲームの説明
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).gameDetail),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).basicInfo,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              DetailLabel(
                title: S.of(context).name,
                text: name,
              ),
              DetailLabel(
                title: S.of(context).developer,
                text: developer,
              ),
              DetailLabel(
                title: S.of(context).publisher,
                text: publisher,
              ),
              DetailLabel(
                title: S.of(context).releaseDate,
                text: DateFormat.yMMMd().format(DateTime.parse(releaseDate)),
              ),
              DetailLabel(
                title: S.of(context).genre,
                text: genre
                    .map((genre) => GameGenre.values
                        .firstWhere((gameGenre) => gameGenre.key == genre)
                        .value)
                    .toList()
                    .join(' / '),
              ),
              DetailLabel(
                title: S.of(context).platform,
                text: GamePlatform.values
                    .firstWhere(
                        (gamePlatform) => gamePlatform.value == platform)
                    .value,
              ),
              DetailLabel(
                title: S.of(context).voice,
                text: voice.join(', '),
              ),
              DetailLabel(
                title: S.of(context).languages,
                text: languages.join(', '),
              ),
              const SizedBox(height: 8.0),
              Text(
                S.of(context).desc,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black54
                      : Colors.white60,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
