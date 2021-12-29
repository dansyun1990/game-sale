import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/widgets/game_sale_card.dart';

/// ゲーム検索用のデリゲートを作成
class GameSearchDelegate extends SearchDelegate {
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
      future: FirebaseFirestore.instance
          .collection('games')
          .where('name', isEqualTo: query)
          .withConverter<Game>(
            fromFirestore: (snapshot, _) => Game.fromDocumentSnapshot(snapshot),
            toFirestore: (obj, _) => obj.toJson(),
          )
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(child: Text(S.of(context).noResults));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          var games =
              snapshot.requireData.docs.map((doc) => doc.data()).toList();
          if (games.isNotEmpty) {
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games.elementAt(index);
                return GameSaleCard(
                  key: UniqueKey(),
                  coverArt: game.coverArt,
                  name: game.name,
                  genre: game.genre,
                  platform: game.platform,
                  basePrice: game.basePrice,
                  salePrice: game.salePrice,
                  discountPercent: game.discountPercent,
                  discountedUntil: game.discountedUntil,
                  now: DateTime.now(),
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
