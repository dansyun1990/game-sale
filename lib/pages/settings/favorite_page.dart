import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/favorites.dart';
import 'package:game_sale/providers/auth_provider.dart';
import 'package:game_sale/providers/favorite_provider.dart';
import 'package:game_sale/screens/home.dart';
import 'package:game_sale/widgets/favorite_card.dart';
import 'package:game_sale/widgets/sign_in_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 気に入り一覧ページを作成
class FavoritePage extends HookConsumerWidget {
  const FavoritePage({Key? key, this.favorites}) : super(key: key);

  final Favorites? favorites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<AnimatedListState> listKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorite),
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const Home(),
                ),
                (_) => false);
            // ログインした場合のみ、お気に入りProviderをリフレッシュ
            if (FirebaseAuth.instance.currentUser != null) {
              ref.refresh(favoriteProvider);
            }
          },
        ),
      ),
      body: ref.watch(authProvider).user == null
          ? const Center(child: SignInButton())
          : Center(
              child: AnimatedList(
                  key: listKey,
                  initialItemCount: favorites!.games.length,
                  itemBuilder: (context, index, animation) {
                    final game = favorites!.games.elementAt(index);
                    final favorite = ref
                        .read(favoriteProvider)
                        .favorites
                        .firstWhere((element) => element.id == game.id,
                            orElse: () => favorites!.favorites.first);

                    return FavoriteCard(
                      key: UniqueKey(),
                      game: game,
                      favorite: favorite,
                      animation: animation,
                      onClicked: () async {
                        favorites!.games
                            .removeWhere((element) => element.id == game.id);
                        ref
                            .read(favoriteProvider)
                            .favorites
                            .removeWhere((element) => element.id == game.id);

                        await ref
                            .read(favoriteProvider.notifier)
                            .deleteFavorite(game.id!);

                        listKey.currentState?.removeItem(
                          index,
                          (context, animation) => FavoriteCard(
                            game: game,
                            favorite: favorite,
                            animation: animation,
                            onClicked: () {},
                          ),
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                    );
                  }),
            ),
    );
  }
}
