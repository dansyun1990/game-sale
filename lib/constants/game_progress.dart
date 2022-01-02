import 'package:game_sale/generated/l10n.dart';

enum GameProgress { trial, ongoing, clear, complete }

extension GameProgressExtension on GameProgress {
  int get key {
    switch (this) {
      case GameProgress.trial:
        return 0;
      case GameProgress.ongoing:
        return 1;
      case GameProgress.clear:
        return 2;
      case GameProgress.complete:
        return 3;
    }
  }

  String get value {
    switch (this) {
      case GameProgress.trial:
        return S.current.trial;
      case GameProgress.ongoing:
        return S.current.ongoing;
      case GameProgress.clear:
        return S.current.clear;
      case GameProgress.complete:
        return S.current.complete;
    }
  }
}
