import 'package:game_sale/models/genre_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームプラットフォーム選択のProviderです。
final genreSelectorProvider =
    StateNotifierProvider<GenreSelectorStateNotifier, GenreState>(
        (ref) => GenreSelectorStateNotifier());

/// ゲームプラットフォームの追加・削除を行うStateNotifierです。
class GenreSelectorStateNotifier extends StateNotifier<GenreState> {
  GenreSelectorStateNotifier() : super(const GenreState());

  /// フィルターに選択した[key]プラットフォームを追加します。
  void add(String key) {
    final newList = [...state.genreList, key];
    state = state.copyWith(genreList: newList);
  }

  /// フィルターに選択した[key]プラットフォームを削除します。
  void remove(String key) {
    final newList = state.genreList.where((element) => element != key).toList();
    state = state.copyWith(genreList: newList);
  }
}
