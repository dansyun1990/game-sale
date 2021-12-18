import 'package:game_sale/generated/l10n.dart';

enum GameGenre { act, adv, fps, ftg, pzl, rcg, rpg, slg, spg, stg, tps }

extension GameGenreExtension on GameGenre {
  String get key {
    switch (this) {
      case GameGenre.act:
        return 'ACT';
      case GameGenre.adv:
        return 'ADV';
      case GameGenre.fps:
        return 'FPS';
      case GameGenre.ftg:
        return 'FTG';
      case GameGenre.pzl:
        return 'PZL';
      case GameGenre.rcg:
        return 'RCG';
      case GameGenre.rpg:
        return 'RPG';
      case GameGenre.slg:
        return 'SLG';
      case GameGenre.spg:
        return 'SPG';
      case GameGenre.stg:
        return 'STG';
      case GameGenre.tps:
        return 'TPS';
    }
  }

  String get value {
    switch (this) {
      case GameGenre.act:
        return S.current.act;
      case GameGenre.adv:
        return S.current.adv;
      case GameGenre.fps:
        return S.current.fps;
      case GameGenre.ftg:
        return S.current.ftg;
      case GameGenre.pzl:
        return S.current.pzl;
      case GameGenre.rcg:
        return S.current.rcg;
      case GameGenre.rpg:
        return S.current.rpg;
      case GameGenre.slg:
        return S.current.slg;
      case GameGenre.spg:
        return S.current.spg;
      case GameGenre.stg:
        return S.current.stg;
      case GameGenre.tps:
        return S.current.tps;
    }
  }
}
