import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';

extension ThemeModeExtension on ThemeMode {
  String get title {
    switch (this) {
      case ThemeMode.system:
        return S.current.system;
      case ThemeMode.light:
        return S.current.light;
      case ThemeMode.dark:
        return S.current.dark;
    }
  }

  String get subTitle {
    switch (this) {
      case ThemeMode.system:
        return S.current.systemDescription;
      case ThemeMode.light:
        return S.current.lightDescription;
      case ThemeMode.dark:
        return S.current.darkDescription;
    }
  }
}
