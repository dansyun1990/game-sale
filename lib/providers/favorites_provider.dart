import 'package:game_sale/models/favorite.dart';
import 'package:game_sale/models/favorites.dart';
import 'package:game_sale/repositories/favorite_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// お気に入り一覧保持のProvider
final favoritesProvider =
    StateNotifierProvider.autoDispose<FavoritesStateNotifier, Favorites>(
  (ref) => FavoritesStateNotifier(),
);

/// お気に入り一覧保持・検索・変更を行うStateNotifier
class FavoritesStateNotifier extends StateNotifier<Favorites> {
  FavoritesStateNotifier() : super(const Favorites(games: [], favorites: [])) {
    fetch();
  }

  /// お気に入り用リポジトリインスタンス生成
  final _favoriteRepository = FavoriteRepository();

  /// お気に入り一覧を読み込む
  Future<void> fetch() async {
    final favoriteSnapshots = await _favoriteRepository.getFavorites();

    if (favoriteSnapshots.size == 0) {
      return;
    }

    final favorites = favoriteSnapshots.docs.map((doc) => doc.data()).toList();

    final gameSnapshots = await _favoriteRepository
        .getGames(favorites.map((favorite) => favorite.id).toList());

    final games = gameSnapshots.docs.map((doc) => doc.data()).toList();
    state = state.copyWith(games: games, favorites: favorites);
  }

  /// 選択された[gameId]をお気に入りに追加
  Future<void> addFavorite(String gameId) async {
    await _favoriteRepository.addFavorite(gameId);

    await fetch();
  }

  /// 選択された[gameId]をお気に入りから削除
  Future<void> deleteFavorite(String gameId) async {
    await _favoriteRepository.deleteFavorite(gameId);

    final games = state.games;
    games.removeWhere((game) => game.id == gameId);

    final favorites = state.favorites;
    favorites.removeWhere((favorite) => favorite.id == gameId);

    state = state.copyWith(games: games, favorites: favorites);
  }

  /// 選択された[notificationType]で該当[gameId]の通知タイプを更新
  Future<void> updateNotification(String gameId, int notificationType) async {
    await _favoriteRepository.updateNotification(gameId, notificationType);

    final favorites = state.favorites
        .map((favorite) => Favorite(
              id: favorite.id,
              notificationType: favorite.id == gameId
                  ? notificationType
                  : favorite.notificationType,
              createdAt: favorite.createdAt,
            ))
        .toList();

    state = state.copyWith(favorites: favorites);
  }
}
