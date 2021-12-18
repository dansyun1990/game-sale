import 'package:flutter/material.dart';
import 'package:game_sale/constants/local_storage_key.dart';
import 'package:game_sale/utils/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// テーマ選択のProviderです。
final themeSelectorProvider =
    StateNotifierProvider<ThemeSelectorStateNotifier, ThemeMode>(
        (ref) => ThemeSelectorStateNotifier());

/// テーマの変更・保存を行うStateNotifierです。
class ThemeSelectorStateNotifier extends StateNotifier<ThemeMode> {
  ThemeSelectorStateNotifier() : super(ThemeMode.system) {
    init();
  }

  /// ストレージ保存のインスタンスを作成します。
  final localStorage = LocalStorage();

  /// 選択されたテーマの保存があれば取得して反映します。
  void init() async {
    final themeIndex = await localStorage.getStorage(LocalStorageKey.themeMode);
    if (themeIndex != null) {
      state = ThemeMode.values.firstWhere(
        (themeMode) => themeMode.index == themeIndex,
        orElse: () => ThemeMode.system,
      );
    }
  }

  /// テーマの変更を行い、選択された[themeMode]をストレージに保存します。
  void change(ThemeMode themeMode) async {
    await localStorage.setStorage(LocalStorageKey.themeMode, themeMode.index);
    state = themeMode;
  }
}
