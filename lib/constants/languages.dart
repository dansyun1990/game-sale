enum Languages { japanese, english, chinese }

extension LanguagesExtension on Languages {
  String get value {
    switch (this) {
      case Languages.japanese:
        return 'ja';
      case Languages.english:
        return 'en';
      case Languages.chinese:
        return 'zh';
    }
  }

  String get title {
    switch (this) {
      case Languages.japanese:
        return '日本語';
      case Languages.english:
        return 'English';
      case Languages.chinese:
        return '简体中文';
    }
  }
}
