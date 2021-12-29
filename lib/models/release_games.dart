import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_sale/models/release_game.dart';

part 'release_games.freezed.dart';

@freezed
class ReleaseGames with _$ReleaseGames {
  const factory ReleaseGames(
      {required List<ReleaseGame> releaseGames,
      @Default(false) bool isLoading,
      @Default(false) bool hasMore}) = _ReleaseGames;
}
