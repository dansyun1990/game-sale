import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/repositories/games_repository.dart';
import 'package:game_sale/widgets/game_sale_card.dart';

/// ゲーム検索用のデリゲートを作成
class GameSearchDelegate extends SearchDelegate {
  /// ゲームセール用リポジトリインスタンス生成
  final _gamesRepository = GamesRepository();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Game>>(
      future: _gamesRepository.getSearchGames(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(child: Text(S.of(context).noResults));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          final games =
              snapshot.requireData.docs.map((doc) => doc.data()).toList();
          if (games.isNotEmpty) {
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 2.0),
                  child: GameSaleCard(
                    key: UniqueKey(),
                    game: game,
                  ),
                );
              },
            );
          } else {
            return Center(child: Text(S.of(context).noResults));
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text(S.of(context).searchMessage));
  }
}
