import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_sale/models/game.dart';

import 'favorite.dart';

part 'favorites.freezed.dart';

@freezed
class Favorites with _$Favorites {
  const factory Favorites({
    required List<Game> games,
    required List<Favorite> favorites,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
  }) = _Favorites;
}
