import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_sale/models/game.dart';

part 'games.freezed.dart';

@freezed
class Games with _$Games {
  const factory Games(
      {required List<Game> games,
      @Default(false) bool isLoading,
      @Default(false) bool hasMore}) = _Games;
}
