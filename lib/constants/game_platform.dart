enum GamePlatform { all, ps4, ps5, nintendoSwitch, steam }

extension GamePlatformExtension on GamePlatform {
  String? get key {
    switch (this) {
      case GamePlatform.all:
        return null;
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

  String get value {
    switch (this) {
      case GamePlatform.all:
        return 'All';
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
