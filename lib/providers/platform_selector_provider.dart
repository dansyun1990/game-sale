import 'package:game_sale/models/platform_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームジャンル選択のProviderです。
final platformSelectorProvider =
    StateNotifierProvider<PlatformSelectorStateNotifier, PlatformState>(
        (ref) => PlatformSelectorStateNotifier());

/// ゲームジャンルの追加・削除を行うStateNotifierです。
class PlatformSelectorStateNotifier extends StateNotifier<PlatformState> {
  PlatformSelectorStateNotifier() : super(const PlatformState());

  /// フィルターに選択した[key]ジャンルを追加します。
  void add(int key) {
    final newList = [...state.platformList, key];
    state = state.copyWith(platformList: newList);
  }

  /// フィルターに選択した[key]ジャンルを削除します。
  void remove(int key) {
    final newList =
        state.platformList.where((element) => element != key).toList();
    state = state.copyWith(platformList: newList);
  }
}
