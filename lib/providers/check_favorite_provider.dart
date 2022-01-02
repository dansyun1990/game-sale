import 'package:game_sale/repositories/favorite_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'favorite_provider.dart';

final checkFavoriteProvider =
    StateNotifierProvider.autoDispose<CheckFavoriteStateNotifier, bool?>(
        (ref) => CheckFavoriteStateNotifier(ref));

class CheckFavoriteStateNotifier extends StateNotifier<bool?> {
  CheckFavoriteStateNotifier(this.ref) : super(null);

  final favoriteRepository = FavoriteRepository();
  final Ref ref;

  Future<void> checkFavorite(String? uid, String gameId) async {
    state = await favoriteRepository.checkFavorite(uid, gameId);
  }

  Future<void> addFavorite(bool favoriteFlag, String gameId) async {
    if (favoriteFlag) {
      await ref.read(favoriteProvider.notifier).addFavorite(gameId);
    } else {
      await favoriteRepository.addFavorite(gameId);
    }
    state = true;
  }

  Future<void> deleteFavorite(bool favoriteFlag, String gameId) async {
    if (favoriteFlag) {
      await ref.read(favoriteProvider.notifier).deleteFavorite(gameId);
    } else {
      await favoriteRepository.deleteFavorite(gameId);
    }
    state = false;
  }
}
