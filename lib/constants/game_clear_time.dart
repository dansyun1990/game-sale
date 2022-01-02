import 'package:game_sale/generated/l10n.dart';

enum GameClearTime {
  tenHours,
  twentyHours,
  fortyHours,
  sixtyHours,
  eightyHours,
  eightyHoursPlus
}

extension GameClearTimeExtension on GameClearTime {
  int get key {
    switch (this) {
      case GameClearTime.tenHours:
        return 0;
      case GameClearTime.twentyHours:
        return 1;
      case GameClearTime.fortyHours:
        return 2;
      case GameClearTime.sixtyHours:
        return 3;
      case GameClearTime.eightyHours:
        return 4;
      case GameClearTime.eightyHoursPlus:
        return 5;
    }
  }

  String get value {
    switch (this) {
      case GameClearTime.tenHours:
        return '0 ~ 10 ' + S.current.hours;
      case GameClearTime.twentyHours:
        return '10 ~ 20 ' + S.current.hours;
      case GameClearTime.fortyHours:
        return '20 ~ 40 ' + S.current.hours;
      case GameClearTime.sixtyHours:
        return '40 ~ 60 ' + S.current.hours;
      case GameClearTime.eightyHours:
        return '60 ~ 80 ' + S.current.hours;
      case GameClearTime.eightyHoursPlus:
        return '80 ~ ' + S.current.hours;
    }
  }
}
