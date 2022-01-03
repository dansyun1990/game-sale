import 'package:game_sale/repositories/favorite_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'favorites_provider.dart';

/// お気に入り保持のProvider
final favoriteProvider =
    StateNotifierProvider.autoDispose<FavoriteStateNotifier, bool?>(
        (ref) => FavoriteStateNotifier(ref));

/// お気に入り保持・変更を行うStateNotifier
class FavoriteStateNotifier extends StateNotifier<bool?> {
  FavoriteStateNotifier(this.ref) : super(null);

  final Ref ref;

  /// お気に入り用リポジトリインスタンス生成
  final _favoriteRepository = FavoriteRepository();

  /// サインインユーザ[uid]のお気に入りに追加済みかどうかを確認
  Future<void> checkFavorite(String? uid, String gameId) async {
    state = await _favoriteRepository.checkFavorite(uid, gameId);
  }

  /// 選択された[gameId]をお気に入りに追加
  Future<void> addFavorite(bool favoriteFlag, String gameId) async {
    // お気に入り一覧から遷移した場合、お気に入り一覧に追加
    if (favoriteFlag) {
      await ref.read(favoritesProvider.notifier).addFavorite(gameId);
    } else {
      await _favoriteRepository.addFavorite(gameId);
    }
    state = true;
  }

  /// 選択された[gameId]をお気に入りから削除
  Future<void> deleteFavorite(bool favoriteFlag, String gameId) async {
    // お気に入り一覧から遷移した場合、お気に入り一覧から削除
    if (favoriteFlag) {
      await ref.read(favoritesProvider.notifier).deleteFavorite(gameId);
    } else {
      await _favoriteRepository.deleteFavorite(gameId);
    }
    state = false;
  }
}
