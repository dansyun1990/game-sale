import 'package:game_sale/constants/languages.dart';
import 'package:game_sale/constants/local_storage_key.dart';
import 'package:game_sale/utils/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 言語選択のProvider
final languageSelectorProvider =
    StateNotifierProvider<LanguageSelectorStateNotifier, Languages>(
        (ref) => LanguageSelectorStateNotifier());

/// 言語の変更・保存を行うStateNotifier
class LanguageSelectorStateNotifier extends StateNotifier<Languages> {
  LanguageSelectorStateNotifier() : super(Languages.japanese) {
    init();
  }

  /// ストレージ保存のインスタンスを作成
  final _localStorage = LocalStorage();

  /// 選択された言語の保存があれば取得して反映
  void init() async {
    final languageIndex =
        await _localStorage.getStorage(LocalStorageKey.language);
    if (languageIndex != null) {
      state = Languages.values
          .firstWhere((languages) => languages.index == languageIndex);
    }
  }

  /// 言語の変更を行い、選択された[languages]をストレージに保存
  void change(Languages languages) async {
    await _localStorage.setStorage(LocalStorageKey.language, languages.index);
    state = languages;
  }
}
