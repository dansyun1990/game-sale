import 'package:game_sale/models/filters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームジャンル選択のProvider
final genreSelectorProvider =
    StateNotifierProvider<FilterStateNotifier, Filters>(
        (ref) => FilterStateNotifier());

/// ゲームプラットフォーム選択のProvider
final platformSelectorProvider =
    StateNotifierProvider<FilterStateNotifier, Filters>(
        (ref) => FilterStateNotifier());

/// フィルターの追加・削除を行うStateNotifier
class FilterStateNotifier extends StateNotifier<Filters> {
  FilterStateNotifier() : super(const Filters());

  /// フィルターに選択した[key]を追加
  void add(String key) {
    final newList = [...state.filters, key];
    state = state.copyWith(filters: newList);
  }

  /// フィルターに選択した[key]を削除
  void remove(String key) {
    final newList = state.filters.where((element) => element != key).toList();
    state = state.copyWith(filters: newList);
  }
}
