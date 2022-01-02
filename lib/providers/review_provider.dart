import 'package:game_sale/constants/game_clear_time.dart';
import 'package:game_sale/constants/game_difficulty.dart';
import 'package:game_sale/constants/game_progress.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// レビュー評価状態保持のProvider
final ratingSelectorProvider = StateProvider.autoDispose<double>((ref) => 0.0);

/// ゲーム難易度状態保持のProvider
final difficultySelectorProvider =
    StateProvider.autoDispose<GameDifficulty?>((ref) => null);

/// ゲーム進捗状態保持のProvider
final progressSelectorProvider =
    StateProvider.autoDispose<GameProgress?>((ref) => null);

/// ゲームクリア時間状態保持のProvider
final clearTimeSelectorProvider =
    StateProvider.autoDispose<GameClearTime?>((ref) => null);
