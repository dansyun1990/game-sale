enum GamePlatform { ps4, ps5, nintendoSwitch, steam }

extension GamePlatformExtension on GamePlatform {
  int get key {
    switch (this) {
      case GamePlatform.ps4:
        return 0;
      case GamePlatform.ps5:
        return 1;
      case GamePlatform.nintendoSwitch:
        return 2;
      case GamePlatform.steam:
        return 3;
    }
  }

  String get value {
    switch (this) {
      case GamePlatform.ps4:
        return 'PS4';
      case GamePlatform.ps5:
        return 'PS5';
      case GamePlatform.nintendoSwitch:
        return 'Switch';
      case GamePlatform.steam:
        return 'Steam';
    }
  }
}
