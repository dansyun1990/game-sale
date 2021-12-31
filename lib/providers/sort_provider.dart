import 'package:game_sale/constants/game_sort.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームセールソート状態保持のProvider
final sortSelectorProvider =
    StateProvider<GameSort>((ref) => GameSort.releaseDateDesc);
