import 'package:game_sale/generated/l10n.dart';

enum GameDifficulty { beginner, easy, normal, hard, maniac }

extension GameDifficultyExtension on GameDifficulty {
  int get key {
    switch (this) {
      case GameDifficulty.beginner:
        return 0;
      case GameDifficulty.easy:
        return 1;
      case GameDifficulty.normal:
        return 2;
      case GameDifficulty.hard:
        return 3;
      case GameDifficulty.maniac:
        return 4;
    }
  }

  String get value {
    switch (this) {
      case GameDifficulty.beginner:
        return S.current.beginner;
      case GameDifficulty.easy:
        return S.current.easy;
      case GameDifficulty.normal:
        return S.current.normal;
      case GameDifficulty.hard:
        return S.current.hard;
      case GameDifficulty.maniac:
        return S.current.maniac;
    }
  }
}
